//
//  ReadPopApp.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 04/12/1446 AH.
//

import SwiftUI
import ReadPopApp
import ReadPopDependencies


@main
struct ReadPopApp: App {
    var body: some Scene {
        WindowGroup {
            let flow = AppFlow(dependencies: DependenciesContainer())
            flow.makeRootView()
        }
    }
}
