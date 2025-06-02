//
//  ArticleDetailViewModel.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 04/12/1446 AH.
//

import Foundation

import SwiftUI

class ArticleDetailViewModel: ObservableObject {
    // Input
    let article: Article
    let goBack: (() -> Void)?

    // Output
    var title: String { article.title }
    var abstract: String { article.abstract }
    var byline: String { article.byline }
    var publishedDate: String { article.publishedDate }
    var url: String { article.url }
    var imageUrl: String? { article.imageUrl }
    var section: String { article.section }

    init(article: Article, goBack: (() -> Void)? = nil) {
        self.article = article
        self.goBack = goBack
    }

    func openInBrowser() {
        guard let url = URL(string: article.url) else { return }
        UIApplication.shared.open(url)
    }
}


