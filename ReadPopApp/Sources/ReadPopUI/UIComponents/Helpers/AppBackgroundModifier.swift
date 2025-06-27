//
//  AppBackgroundModifier.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 13/12/1446 AH.
//

import SwiftUI

public struct AppBackgroundModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(
                    colors: [Color.rpGradientStart.opacity(0.3), Color.rpGradientAltStart],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
            )
    }
}

public extension View {
    func applyAppBackground() -> some View {
        self.modifier(AppBackgroundModifier())
    }
}
