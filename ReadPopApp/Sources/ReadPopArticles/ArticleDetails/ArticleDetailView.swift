//
//  ArticleDetailView.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 04/12/1446 AH.
//

import SwiftUI
import ReadPopUI

struct ArticleDetailView: View {
    @ObservedObject var viewModel: ArticleDetailViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            RPHeaderView(title: "Article Detail", style: .regular, onBack: viewModel.goBack)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ArticleImageView(imageUrl: viewModel.article.imageUrl)
                    articleInfoSection
                    readMoreButton
                }
                .padding()
            }
        }
        .applyAppBackground()
        .navigationBarHidden(true)
    }
    
    private var articleInfoSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(viewModel.article.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            HStack {
                Text(viewModel.article.byline)
                Spacer()
                Text(viewModel.article.publishedDate)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
            
            Text(viewModel.article.abstract)
                .font(.body)
            
            if !viewModel.article.section.isEmpty {
                Text("Section: \(viewModel.article.section)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    private var readMoreButton: some View {
        Button {
            if let url = viewModel.articleURL() {
                UIApplication.shared.open(url)
            }
        } label: {
            Text("Read Full Article")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.rpPrimary)
                .foregroundColor(.white)
                .cornerRadius(12)
        }
    }

}
