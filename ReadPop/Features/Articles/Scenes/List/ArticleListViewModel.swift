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
    @Published var selectedPeriod: ArticlePeriod = .default {
        didSet {
            guard oldValue != selectedPeriod else { return }
            fetchArticles()
        }
    }
    @Published var state: ArticleListViewState = .idle
    
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
                    self.articles = result
                    self.state = result.isEmpty ? .empty : .success
                }
            } catch {
                await MainActor.run {
                    self.articles = []
                    self.state = .failure
                }
            }
        }
    }
    
    func selectArticle(_ article: Article) {
        onSelect(article)
    }
}
