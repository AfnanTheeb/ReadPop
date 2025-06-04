//
//  ArticleCardsLayoutView.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 06/12/1446 AH.
//

import SwiftUI

struct ArticleCardsLayoutView: View {
    let articles: [Article]
    let onArticleTap: (Article) -> Void
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<groupCount, id: \.self) { index in
                    let startIndex = index * 5
                    let group = Array(articles[startIndex..<min(startIndex + 5, articles.count)])
                    
                    VStack(spacing: 16) {
                        if group.indices.contains(0) {
                            ArticleCardView(article: group[0], size: .large)
                                .frame(maxWidth: .infinity)
                                .onTapGesture {
                                    onArticleTap(group[0])
                                }
                        }
                        
                        if group.indices.contains(1), group.indices.contains(2) {
                            HStack {
                                ArticleCardView(article: group[1], size: .small)
                                    .frame(maxWidth: .infinity)
                                    .onTapGesture { onArticleTap(group[1]) }
                                
                                ArticleCardView(article: group[2], size: .small)
                                    .frame(maxWidth: .infinity)
                                    .onTapGesture { onArticleTap(group[2]) }
                            }
                        }
                        
                        if group.indices.contains(3), group.indices.contains(4) {
                            HStack {
                                ArticleCardView(article: group[3], size: .small)
                                    .frame(maxWidth: .infinity)
                                    .onTapGesture { onArticleTap(group[3]) }
                                
                                ArticleCardView(article: group[4], size: .small)
                                    .frame(maxWidth: .infinity)
                                    .onTapGesture { onArticleTap(group[4]) }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal,10)
        }
    }
    
    private var groupCount: Int {
        articles.count / 5 + (articles.count % 5 == 0 ? 0 : 1)
    }
}


//#Preview {
//    ArticleCardsLayoutView()
//}
