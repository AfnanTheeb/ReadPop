//
//  ArticleDetailFlow.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 04/12/1446 AH.
//

import Foundation
import SwiftUI

final class ArticleDetailFlow {
    private let article: Article
    private let onBack: () -> Void

    init(article: Article, onBack: @escaping () -> Void) {
        self.article = article
        self.onBack = onBack
    }

    func makeView() -> some View {
        let viewModel = ArticleDetailViewModel(article: article, goBack: onBack)
        return ArticleDetailView(viewModel: viewModel)
    }
}
