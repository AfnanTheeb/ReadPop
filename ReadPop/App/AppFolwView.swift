//
//  AppFolwView.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 04/12/1446 AH.
//

import SwiftUI

struct AppFlowView: View {
    @ObservedObject var flow: AppFlow
    
    var body: some View {
        NavigationStack(path: $flow.path) {
            flow.contentView(for: flow.state)
                .navigationDestination(for: AppState.self) { newState in
                    flow.contentView(for: newState)
                }
        }
    }
}
