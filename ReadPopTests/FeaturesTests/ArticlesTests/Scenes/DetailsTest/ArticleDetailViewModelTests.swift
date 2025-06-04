//
//  ArticleDetailViewModelTests.swift
//  ReadPopTests
//
//  Created by Afnan Alotaibi on 08/12/1446 AH.
//

import XCTest
@testable import ReadPop

final class ArticleDetailViewModelTests: XCTestCase {
    
    func test_propertiesShouldReflectArticleContent() {
        // Arrange
        let article = Article.dummy
        let viewModel = ArticleDetailViewModel(article: article)

        // Assert
        XCTAssertEqual(viewModel.title, article.title)
        XCTAssertEqual(viewModel.abstract, article.abstract)
        XCTAssertEqual(viewModel.byline, article.byline)
        XCTAssertEqual(viewModel.publishedDate, article.publishedDate)
        XCTAssertEqual(viewModel.url, article.url)
        XCTAssertEqual(viewModel.imageUrl, article.imageUrl)
        XCTAssertEqual(viewModel.section, article.section)
    }
    
    func test_goBackClosureShouldBeCalled() {
        // Arrange
        var didCallGoBack = false
        let viewModel = ArticleDetailViewModel(article: .dummy) {
            didCallGoBack = true
        }

        // Act
        viewModel.goBack?()

        // Assert
        XCTAssertTrue(didCallGoBack)
    }
}
