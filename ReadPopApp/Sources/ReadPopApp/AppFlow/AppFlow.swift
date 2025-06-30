//
//  AppFlow.swift
//  ReadPopApp
//
//  Created by Afnan Alotaibi on 29/12/1446 AH.
//

import Foundation
import SwiftUI
import ReadPopArticles
import ReadPopDependencies

public final class AppFlow: ObservableObject {
    @Published public var path: [AppState] = []
    @Published public var state: AppState = .articles

    private let dependencies: DependenciesContainer

    public init(dependencies: DependenciesContainer) {
        self.dependencies = dependencies
    }

    public func makeRootView() -> some View {
        AppFlowView(flow: self)
    }

    @ViewBuilder
    public func contentView(for state: AppState) -> some View {
        switch state {
        case .articles:
            ArticleListFlow(
                service: dependencies.articleService,
                onSelect: { [weak self] article in
                    self?.path.append(.articleDetail(article))
                }
            ).makeView()

        case .articleDetail(let article):
            ArticleDetailFlow(
                article: article,
                onBack: { [weak self] in
                    self?.path.removeLast()
                }
            ).makeView()
        }
    }
}
