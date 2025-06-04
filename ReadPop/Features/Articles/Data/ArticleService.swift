//
//  ArticleService.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 04/12/1446 AH.
//

import Foundation

// MARK: Protocol
protocol ArticleService {
    func fetchTopArticles(period: ArticlePeriod) async throws -> [Article]
}

// MARK: Implementation
final class DefaultArticleService: ArticleService {

    private let networkClient: NetworkClientProtocol

    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
    }

    private func makeTopArticlesRequest(period: ArticlePeriod) -> NetworkRequest {
        return NetworkRequest(
            path: "svc/mostpopular/v2/viewed/\(period.rawValue).json",
            method: .get
        )
    }

    func fetchTopArticles(period: ArticlePeriod) async throws -> [Article] {
        let request = makeTopArticlesRequest(period: period)
        let response: ArticleResponseDTO = try await networkClient.execute(request)
        return response.results.map { $0.toDomain() }
    }
}
