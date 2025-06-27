//
//  ArticleDetailViewModel.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 04/12/1446 AH.
//

import Foundation

class ArticleDetailViewModel: ObservableObject {
    // Input
    let article: Article
    let goBack: (() -> Void)?

    init(article: Article, goBack: (() -> Void)? = nil) {
        self.article = article
        self.goBack = goBack
    }

    func articleURL() -> URL? {
        URL(string: article.url)
    }
}


