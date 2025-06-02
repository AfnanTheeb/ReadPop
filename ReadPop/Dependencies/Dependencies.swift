//
//  Dependencies.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 04/12/1446 AH.
//

import Foundation

final class DependenciesContainer {
    
    let articleService: ArticleService
    
    init() {
        let networkClient = NetworkClient(
            baseURL: EnvironmentConfig.baseURL,
            apiKey: EnvironmentConfig.apiKey
        )
        
        self.articleService = DefaultArticleService(networkClient: networkClient)
    }
}
