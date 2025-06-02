//
//  AppFlow.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 04/12/1446 AH.
//

import Foundation
import SwiftUI

final class AppFlow: ObservableObject {
    @Published var path: [AppState] = []
    @Published var state: AppState = .articles
    
    private let dependencies: DependenciesContainer
    
    init(dependencies: DependenciesContainer) {
        self.dependencies = dependencies
    }
    
    func makeRootView() -> some View {
        AppFlowView(flow: self)
    }
    
    @ViewBuilder
    func contentView(for state: AppState) -> some View {
        switch state {
        case .articles:
            
            ArticleListFlow(
                service: dependencies.articleService,
                onSelect: { article in
                    self.path.append(.articleDetail(article))
                }
            ).makeView()
            
        case .articleDetail(let article):
            
            ArticleDetailFlow(
                article: article,
                onBack: {
                    self.path.removeLast()
                }
            ).makeView()
            
        }
    }
}
