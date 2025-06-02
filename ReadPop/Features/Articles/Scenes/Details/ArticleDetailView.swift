//
//  ArticleDetailView.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 04/12/1446 AH.
//

import SwiftUI
import SwiftUI

struct ArticleDetailView: View {
    @ObservedObject var viewModel: ArticleDetailViewModel

    var body: some View {
        VStack(spacing: 0) {
            // Header
            RPHeaderView(title: "Article Detail", style: .regular, onBack: viewModel.goBack)

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    if let imageUrl = viewModel.imageUrl, let url = URL(string: imageUrl) {
                        AsyncImage(url: url) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 240)
                                    .clipped()
                                    .cornerRadius(16)
                            } else {
                                placeholder
                            }
                        }
                    } else {
                        placeholder
                    }
                    
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
                .padding()
            }
        }
        .navigationBarHidden(true)
    }

    private var placeholder: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color.gray.opacity(0.3))
            .frame(height: 240)
    }
}
