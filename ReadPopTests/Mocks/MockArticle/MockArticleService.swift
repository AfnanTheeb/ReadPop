//
//  MockArticleService.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 06/12/1446 AH.
//
import Foundation
@testable import ReadPop

final class MockArticleService: ArticleService {
    
    var articlesToReturn: [Article] = []
    var shouldThrowError = false
    var lastRequestedPeriod: ArticlePeriod?
    
    func fetchTopArticles(period: ArticlePeriod) async throws -> [Article] {
        lastRequestedPeriod = period
        
        if shouldThrowError {
            throw NSError(domain: "MockError", code: 123, userInfo: [NSLocalizedDescriptionKey: "Mock failure"])
        }
        
        return articlesToReturn
    }
}
