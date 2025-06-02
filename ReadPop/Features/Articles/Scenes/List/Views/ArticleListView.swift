//
//  ArticleListView.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 04/12/1446 AH.
//

import SwiftUI

import SwiftUI

struct ArticleListView: View {
    @ObservedObject var viewModel: ArticleListViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            RPHeaderView(title: "MOST POPULAR")
            PeriodSelectorView(selectedPeriod: $viewModel.selectedPeriod)
            
            contentView
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        switch viewModel.state {
        case .idle:
            Color.clear
            
        case .loading:
            RPLoaderView()
            
        case .failure:
            RPErrorView(retryAction: viewModel.fetchArticles)
            
        case .empty:
            emptyView
            
        case .success:
            ArticleCardsLayoutView(
                articles: viewModel.articles,
                onArticleTap: viewModel.selectArticle
            )
        }
    }
    
    private var emptyView: some View {
        VStack(spacing: 8) {
            Spacer()
            Text("No articles yet")
                .foregroundColor(.gray)
            Button("Reload") {
                viewModel.fetchArticles()
            }
            .padding(.vertical, 6)
            .padding(.horizontal, 14)
            .background(Color.rpPrimary.opacity(0.1))
            .cornerRadius(8)
            Spacer()
        }
    }
}
