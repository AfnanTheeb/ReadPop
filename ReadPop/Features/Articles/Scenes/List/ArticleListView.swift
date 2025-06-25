//
//  ArticleListView.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 04/12/1446 AH.
//

import SwiftUI

struct ArticleListView: View {
    @ObservedObject var viewModel: ArticleListViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            RPHeaderView(title: "MOST POPULAR")
            PeriodSelectorView(selectedPeriod: $viewModel.selectedPeriod)

            contentView
        }
        .applyAppBackground()
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
            SectionFilterView(viewModel: viewModel)
            ArticleRowsView(
                rows: viewModel.buildArticleRows(),
                onTap: viewModel.selectArticle
            )
        }
    }
    
    private var emptyView: some View {
        VStack(spacing: 12) {
            Spacer()
            
            Image(systemName: "doc.text.magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.rpPrimaryLight)
            
            Text("No articles yet")
                .font(FontTheme.SummaryText.regular(size: 16))
                .foregroundColor(.rpTextSecondary)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}
