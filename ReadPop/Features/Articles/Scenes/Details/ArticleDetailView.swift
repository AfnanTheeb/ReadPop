//
//  ArticleDetailView.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 04/12/1446 AH.
//

import SwiftUI

struct ArticleDetailView: View {
    @ObservedObject var viewModel: ArticleDetailViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            RPHeaderView(title: "Article Detail", style: .regular, onBack: viewModel.goBack)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ArticleImageView(imageUrl: viewModel.imageUrl)
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
            Text(viewModel.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            HStack {
                Text(viewModel.byline)
                Spacer()
                Text(viewModel.publishedDate)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
            
            Text(viewModel.abstract)
                .font(.body)
            
            if !viewModel.section.isEmpty {
                Text("Section: \(viewModel.section)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    private var readMoreButton: some View {
        Button(action: viewModel.openInBrowser) {
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
