//
//  AppFlowView.swift
//  ReadPopApp
//
//  Created by Afnan Alotaibi on 29/12/1446 AH.
//

import SwiftUI

public struct AppFlowView: View {
    @ObservedObject var flow: AppFlow

    public var body: some View {
        NavigationStack(path: $flow.path) {
            flow.contentView(for: flow.state)
                .navigationDestination(for: AppState.self) { newState in
                    flow.contentView(for: newState)
                }
        }
    }
}
