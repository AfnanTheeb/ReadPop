//
//  Dependencies.swift
//  ReadPopApp
//
//  Created by Afnan Alotaibi on 29/12/1446 AH.
//

import Foundation
import ReadPopEnvironment
import ReadPopArticles
import ReadPopCore

public final class DependenciesContainer {

    public let articleService: ArticleServiceProtocol

    public init() {
        let networkClient = NetworkClient(
            baseURL: EnvironmentConfig.baseURL,
            apiKey: EnvironmentConfig.apiKey
        )

        self.articleService = ArticleService(client: networkClient)
    }
}
