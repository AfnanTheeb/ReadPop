//
//  NetworkClient.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 04/12/1446 AH.
//

import Foundation

protocol NetworkClientProtocol {
    func execute<T: Decodable>(_ request: NetworkRequest) async throws -> T
}

struct NetworkClient: NetworkClientProtocol {
    private let baseURL: URL
    private let apiKey: String
    private let session: URLSession

    init(baseURL: URL, apiKey: String, session: URLSession = .shared) {
        self.baseURL = baseURL
        self.apiKey = apiKey
        self.session = session
    }

    func execute<T: Decodable>(_ request: NetworkRequest) async throws -> T {
        // 1. Build the URL
        var components = URLComponents(url: baseURL.appendingPathComponent(request.path), resolvingAgainstBaseURL: false)!
        components.queryItems = request.queryItems + [URLQueryItem(name: "api-key", value: apiKey)]

        guard let url = components.url else {
            throw URLError(.badURL)
        }

        // 2. Create URLRequest
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.httpBody = request.body

        // 3. Make network call
        let (data, response) = try await session.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        // 4. Decode
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(T.self, from: data)
    }
}
