//
//  ArticleListViewModelTests.swift
//  ReadPopTests
//
//  Created by Afnan Alotaibi on 06/12/1446 AH.
//

import XCTest
import Combine
@testable import ReadPop

final class ArticleListViewModelTests: XCTestCase {
    
    // MARK: - Properties
    private var cancellables: Set<AnyCancellable>!
    private var mockService: MockArticleService!
    private var viewModel: ArticleListViewModel!
    
    // MARK: - Setup & Teardown
    override func setUp() {
        super.setUp()
        cancellables = []
        mockService = MockArticleService()
    }

    override func tearDown() {
        cancellables = nil
        mockService = nil
        viewModel = nil
        super.tearDown()
    }

    // MARK: - Tests

    func test_init_shouldFetchArticlesImmediately() {
        // Arrange
        mockService.articlesToReturn = [Article.dummy]
        let expectation = expectation(description: "Should reach .success")

        viewModel = ArticleListViewModel(articleService: mockService) { _ in }

        viewModel.$state
            .dropFirst()
            .sink { state in
                if state == .success {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        // Assert
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(viewModel.articles.count, 1)
        XCTAssertEqual(viewModel.state, .success)
    }

    func test_fetchArticles_withEmptyResult_shouldSetEmptyState() {
        // Arrange
        mockService.articlesToReturn = []
        let expectation = expectation(description: "Should reach .empty")

        viewModel = ArticleListViewModel(articleService: mockService) { _ in }

        viewModel.$state
            .dropFirst()
            .sink { state in
                if state == .empty {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        // Assert
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(viewModel.articles, [])
        XCTAssertEqual(viewModel.state, .empty)
    }

    func test_fetchArticles_withError_shouldSetFailureState() {
        // Arrange
        mockService.shouldThrowError = true
        let expectation = expectation(description: "Should reach .failure")

        viewModel = ArticleListViewModel(articleService: mockService) { _ in }

        viewModel.$state
            .dropFirst()
            .sink { state in
                if state == .failure {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        // Assert
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(viewModel.articles, [])
        XCTAssertEqual(viewModel.state, .failure)
    }

    func test_selectArticle_shouldCallOnSelect() {
        // Arrange
        let expected = Article.dummy
        var selected: Article?
        viewModel = ArticleListViewModel(articleService: mockService) {
            selected = $0
        }

        // Act
        viewModel.selectArticle(expected)

        // Assert
        XCTAssertEqual(selected?.id, expected.id)
    }

    func test_selectedPeriod_whenValueChanges_shouldCallFetchArticlesAndUpdateArticles() {
        // Arrange
        let expectation = expectation(description: "Should call fetchArticles on value change")
        let dummyArticle = Article.dummy
        mockService.articlesToReturn = [dummyArticle]
        
        var didCall = false
        viewModel = ArticleListViewModel(articleService: mockService) { _ in }
        
        viewModel.$state
            .dropFirst()
            .sink { state in
                if self.viewModel.selectedPeriod != .default {
                    if state == .loading {
                        didCall = true
                        expectation.fulfill()
                    }
                }
            }
            .store(in: &cancellables)
        
        // Act
        viewModel.selectedPeriod = .oneDay

        // Assert
        wait(for: [expectation], timeout: 2.0)
        
        XCTAssertTrue(didCall, "Expected fetchArticles to be called when period changes")
        XCTAssertEqual(mockService.lastRequestedPeriod, .oneDay, "Expected correct period to be sent to service")
        XCTAssertNotEqual(viewModel.articles, [dummyArticle], "Expected articles to be updated")
      
    }
}
