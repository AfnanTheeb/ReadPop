//
//  NetworkClient.swift
//  ReadPopApp
//
//  Created by Afnan Alotaibi on 29/12/1446 AH.
//

import Foundation

// MARK: - Protocol

public protocol NetworkClientProtocol {
    func execute<T: Decodable>(_ request: NetworkRequest) async throws -> T
}

// MARK: - NetworkClient

public final class NetworkClient: NetworkClientProtocol {
    private let baseURL: URL
    private let apiKey: String
    private let session: URLSession
    private let decoder: JSONDecoder

    public init(
        baseURL: URL,
        apiKey: String,
        session: URLSession = .shared,
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.baseURL = baseURL
        self.apiKey = apiKey
        self.session = session
        self.decoder = decoder
        self.decoder.dateDecodingStrategy = .iso8601
    }

    public func execute<T: Decodable>(_ request: NetworkRequest) async throws -> T {
        let urlRequest = try buildURLRequest(from: request)
        let (data, response) = try await session.data(for: urlRequest)
        try validate(response: response)

        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailed(error)
        }
    }
}

// MARK: - Private Helpers

private extension NetworkClient {
    
    func buildURLRequest(from request: NetworkRequest) throws -> URLRequest {
        var components = URLComponents(url: baseURL.appendingPathComponent(request.path), resolvingAgainstBaseURL: false)
        components?.queryItems = request.queryItems + [URLQueryItem(name: "api-key", value: apiKey)]
        
        guard let url = components?.url else {
            throw NetworkError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.httpBody = request.body
        
        return urlRequest
    }
    
    func validate(response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        switch httpResponse.statusCode {
        case 200..<300:
            return
        case 401:
            throw NetworkError.unauthorized
        case 404:
            throw NetworkError.notFound
        default:
            throw NetworkError.serverError(statusCode: httpResponse.statusCode)
        }
    }
}

// MARK: - Network Errors

public enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case unauthorized
    case notFound
    case serverError(statusCode: Int)
    case decodingFailed(Error)
}

// MARK: - Localized Error Descriptions

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL. Please contact support."
        case .invalidResponse:
            return "Invalid server response. Please try again later."
        case .unauthorized:
            return "You are not authorized to perform this action."
        case .notFound:
            return "The requested resource was not found."
        case .serverError(let statusCode):
            return "Server error occurred. Status code: \(statusCode)."
        case .decodingFailed(let decodingError):
            return "Failed to decode data: \(decodingError.localizedDescription)"
        }
    }
}
