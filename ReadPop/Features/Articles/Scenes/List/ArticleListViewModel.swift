//
//  ArticleListViewModel.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 04/12/1446 AH.
//

import Foundation

enum ArticleListViewState: Equatable {
    case idle
    case loading
    case success
    case empty
    case failure
}

class ArticleListViewModel: ObservableObject {
    
    @Published var articles: [Article] = []
    @Published var state: ArticleListViewState = .idle
    @Published var selectedPeriod: ArticlePeriod = .default {
        didSet {
            guard oldValue != selectedPeriod else { return }
            fetchArticles()
        }
    }
    @Published var selectedSection: String? = nil {
        didSet {
            applySectionFilter()
        }
    }
    
    var availableSections: [String] {
        Set(allArticles.map { $0.section.lowercased() }).sorted()
    }
    
    private var allArticles: [Article] = []
    private let articleService: ArticleService
    let onSelect: (Article) -> Void
    
    init(articleService: ArticleService, onSelect: @escaping (Article) -> Void) {
        self.articleService = articleService
        self.onSelect = onSelect
        fetchArticles()
    }
    
    func fetchArticles() {
        state = .loading
        Task {
            do {
                let result = try await articleService.fetchTopArticles(period: selectedPeriod)
                await MainActor.run {
                    self.allArticles = result
                    selectedSection = nil
                    applySectionFilter()
                }
            } catch {
                await MainActor.run {
                    self.articles = []
                    self.state = .failure
                }
            }
        }
    }
    
    private func applySectionFilter() {
        if let selected = selectedSection {
            let filtered = allArticles.filter {
                return $0.section.lowercased() == selected.lowercased()
            }
            articles = filtered
        } else {
            articles = allArticles
        }
        
        state = articles.isEmpty ? .empty : .success
    }
    
    func selectArticle(_ article: Article) {
        onSelect(article)
    }
    
    func buildArticleRows() -> [ArticleRowType] {
        var result: [ArticleRowType] = []
        var index = 0

        while index < articles.count {
            let isLargeCard = index % 5 == 0
            let currentArticle = articles[index]

            if isLargeCard {
                result.append(.single(currentArticle))
                index += 1
            } else if index + 1 < articles.count {
                let nextArticle = articles[index + 1]
                result.append(.pair(currentArticle, nextArticle))
                index += 2
            } else {
                result.append(.single(currentArticle))
                index += 1
            }
        }

        return result
    }
}
