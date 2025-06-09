//
//  AppBackgroundModifier.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 13/12/1446 AH.
//

import SwiftUI

struct AppBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(
                    colors: [Color.white, Color.rpGradientAltStart],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
            )
    }
}

extension View {
    func applyAppBackground() -> some View {
        self.modifier(AppBackgroundModifier())
    }
}
