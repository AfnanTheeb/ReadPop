//
//  ArticleCardsLayoutView.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 06/12/1446 AH.
//

import SwiftUI

enum ArticleRowType: Identifiable {
    case single(Article)
    case pair(Article, Article)

    var id: String {
        switch self {
        case .single(let article): return article.id
        case .pair(let firstArticle, _): return firstArticle.id
        }
    }
}

struct ArticleRowsView: View {
    let rows: [ArticleRowType]
    let onTap: (Article) -> Void

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(rows) { row in
                    switch row {
                    case .single(let article):
                        ArticleCardView(article: article, size: .large)
                            .onTapGesture { onTap(article) }

                    case .pair(let a, let b):
                        HStack(spacing: 12) {
                            ArticleCardView(article: a, size: .small)
                                .onTapGesture { onTap(a) }

                            ArticleCardView(article: b, size: .small)
                                .onTapGesture { onTap(b) }
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
        }
    }
}
