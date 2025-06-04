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
    
    var cardPadding: CGFloat {
        return 6
    }
}

struct ArticleCardView: View {
    let article: Article
    let size: ArticleCardSize
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Image
            if let imageUrl = article.imageUrl, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .frame(height: size.imageHeight)
                            .cornerRadius(12)
                            .clipped()
                            .aspectRatio(contentMode: .fit)
                    } else {
                        placeholder
                    }
                }
                .frame(height: size.imageHeight)
            } else {
                placeholder
            }


            // Title
            Text(article.title)
                .font(size.titleFont)
                .foregroundColor(.primary)
                .lineLimit(2)
                .truncationMode(.tail)
            
            // Byline + Date
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
        .padding(size.cardPadding)
        .background(Color.rpSurface)
        .cornerRadius(16)
    }
    
    private var placeholder: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.gray.opacity(0.3))
            .frame(height: size.imageHeight)
    }
}
