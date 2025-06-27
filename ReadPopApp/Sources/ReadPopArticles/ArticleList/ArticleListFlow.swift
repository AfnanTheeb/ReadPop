//
//  ArticleListFlow.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 04/12/1446 AH.
//

import Foundation
import SwiftUI

public final class ArticleListFlow {
    private let service: ArticleServiceProtocol
    private let onSelect: (Article) -> Void

    public init(service: ArticleServiceProtocol, onSelect: @escaping (Article) -> Void) {
        self.service = service
        self.onSelect = onSelect
    }

    public func makeView() -> some View {
        let viewModel = ArticleListViewModel(
            articleService: service,
            onSelect: onSelect
        )
        return ArticleListView(viewModel: viewModel)
    }
}

