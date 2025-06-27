//
//  ArticleService.swift
//  ReadPopApp
//
//  Created by Afnan Alotaibi on 29/12/1446 AH.
//

import Foundation
import ReadPopCore

public protocol ArticleServiceProtocol {
    func fetchArticles(period: Int) async throws -> [Article]
}

public struct ArticleService: ArticleServiceProtocol {
    private let client: NetworkClientProtocol

    public init(client: NetworkClientProtocol) {
        self.client = client
    }

    public func fetchArticles(period: Int) async throws -> [Article] {
        let request = NetworkRequest(path: "mostpopular/v2/viewed/\(period).json")
        let response: ArticleResponse = try await client.execute(request)
        return response.results.map { $0.toDomain() }
    }
}
