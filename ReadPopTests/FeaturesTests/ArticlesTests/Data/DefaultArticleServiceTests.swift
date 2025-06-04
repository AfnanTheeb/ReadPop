//
//  DefaultArticleServiceTests.swift
//  ReadPopTests
//
//  Created by Afnan Alotaibi on 06/12/1446 AH.
//

import XCTest
@testable import ReadPop

final class DefaultArticleServiceTests: XCTestCase {
    
    func test_fetchTopArticles_returnsCorrectArticles() async throws {
        // Arrange
        let mockClient = MockNetworkClient()
        mockClient.mockData = loadTestJSON(named: "articles_mock")
        
        let service = DefaultArticleService(networkClient: mockClient)
        
        // Act
        let articles = try await service.fetchTopArticles(period: .sevenDays)
        
        // Assert
        XCTAssertEqual(articles.count, 4)
        XCTAssertEqual(articles.first?.title, "On the Campaign Trail, Elon Musk Juggled Drugs and Family Drama")
    }
}
