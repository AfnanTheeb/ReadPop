//
//  ArticleCardView.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 06/12/1446 AH.
//

import SwiftUI

enum ArticleCardSize {
    case small
    case large
    
    var imageHeight: CGFloat {
        switch self {
        case .large: return 220
        case .small: return 160
        }
    }
    
    var titleFont: Font {
        switch self {
        case .large: return .headline
        case .small: return .subheadline
        }
    }
}

struct ArticleCardView: View {
    let article: Article
    let size: ArticleCardSize
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            articleImage
            
            VStack(alignment: .leading, spacing: 6) {
                Text(article.title)
                    .font(size.titleFont)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .truncationMode(.tail)
                
                HStack {
                    Text(article.byline)
                        .lineLimit(1)
                        .truncationMode(.tail)
                    
                    Spacer()
                    
                    Text(article.publishedDate)
                        .lineLimit(1)
                }
                .font(.caption)
                .foregroundColor(.secondary)
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    private var articleImage: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let height = size.imageHeight

            AsyncImage(url: URL(string: article.imageUrl ?? "")) { phase in
                imageView(for: phase, width: width, height: height)
            }
        }
        .frame(height: size.imageHeight)
    }

    @ViewBuilder
    private func imageView(for phase: AsyncImagePhase, width: CGFloat, height: CGFloat) -> some View {
        switch phase {
        case .empty:
            placeholder
                .frame(width: width, height: height)

        case .success(let image):
            image
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipped()
                .cornerRadius(12)
                .transition(.opacity.combined(with: .scale))
                .animation(.easeInOut(duration: 0.3), value: true)
            
        // Handles .failure and any future unknown cases
        @unknown default:
            placeholder
                .frame(width: width, height: height)
        }
    }
    
    private var placeholder: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.gray.opacity(0.3))
            .overlay(
                Image(systemName: "photo")
                    .foregroundColor(.white.opacity(0.6))
            )
            .frame(height: size.imageHeight)
    }
}
