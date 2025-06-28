//
//  ArticleListViewModel.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 04/12/1446 AH.
//

import Foundation
import ReadPopCore

enum ArticleListViewState: Equatable {
    case idle
    case loading
    case success(articles: [Article], selectedSection: String)
    case empty
    case failure(String)
    
    var availableSections: [String] {
        switch self {
        case .success(let articles, _):
            var sections = Set(articles.map { $0.section })
            sections.insert("All")
            return Array(sections).sorted()
        default:
            return ["All"]
        }
    }
    
    var filteredArticles: [Article] {
        switch self {
        case .success(let articles, let selectedSection):
            if selectedSection == "All" { return articles }
            return articles.filter { $0.section == selectedSection }
        default:
            return []
        }
    }
    
    var rows: [ArticleRowType] {
        var result: [ArticleRowType] = []
        var index = 0
        let articles = filteredArticles
        
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

class ArticleListViewModel: ObservableObject {
    
    @Published var state: ArticleListViewState = .idle
    @Published var selectedPeriod: ArticlePeriod = .sevenDays {
        didSet {
            guard oldValue != selectedPeriod else { return }
            fetchArticles()
        }
    }
    
    private let articleService: ArticleServiceProtocol
    let onSelect: (Article) -> Void
    
    init(articleService: ArticleServiceProtocol, onSelect: @escaping (Article) -> Void) {
        self.articleService = articleService
        self.onSelect = onSelect
        fetchArticles()
    }
    
    func fetchArticles() {
        state = .loading
        Task {
            do {
                let result = try await articleService.fetchArticles(period: selectedPeriod.rawValue)
                await MainActor.run {
                    if result.isEmpty {
                        state = .empty
                    } else {
                        state = .success(articles: result, selectedSection: "All")
                    }
                }
            } catch {
                await MainActor.run {
                    state = .failure(error.localizedDescription)
                }
            }
        }
    }
    
    func selectSection(_ section: String) {
        switch state {
        case .success(let articles, _):
            state = .success(articles: articles, selectedSection: section)
        default:
            break
        }
    }
    
    func selectArticle(_ article: Article) {
        onSelect(article)
    }
}
