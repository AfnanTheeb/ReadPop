//
//  ArticleCardView.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 06/12/1446 AH.
//

import SwiftUI
import ReadPopUI

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
        case .large: return FontTheme.SummaryText.regular(size: 18).bold()
        case .small: return FontTheme.SummaryText.regular(size: 16).bold()
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
                .font(.caption).bold()
                .foregroundColor(.secondary)
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    private var articleImage: some View {
        GeometryReader { geo in
            RPAsyncImageView(
                imageUrl: article.imageUrl,
                width: geo.size.width,
                height: size.imageHeight,
                cornerRadius: 12
            )
        }
        .frame(height: size.imageHeight)
    }
}
