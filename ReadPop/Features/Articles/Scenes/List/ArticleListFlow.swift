//
//  ArticleListFlow.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 04/12/1446 AH.
//

import Foundation
import SwiftUI

final class ArticleListFlow {
    private let service: ArticleService
    private let onSelect: (Article) -> Void

    init(service: ArticleService, onSelect: @escaping (Article) -> Void) {
        self.service = service
        self.onSelect = onSelect
    }

    func makeView() -> some View {
        let viewModel = ArticleListViewModel(
            articleService: service,
            onSelect: onSelect
        )
        return ArticleListView(viewModel: viewModel)
    }
}

