//
//  RPErrorView.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 06/12/1446 AH.
//

import SwiftUI

public struct RPErrorView: View {
    let message: String
    let retryAction: () -> Void
    
    public init(message: String = "Failed to Load", retryAction: @escaping () -> Void) {
        self.message = message
        self.retryAction = retryAction
    }
    
    public var body: some View {
        VStack(spacing: 12) {
            Spacer()
            
            Text(message)
                .font(FontTheme.SummaryText.regular(size: 24))
                .foregroundStyle(Color.rpPrimary)
                .multilineTextAlignment(.center)
            
            Button(action: retryAction) {
                Text("Retry")
                    .font(FontTheme.SummaryText.regular(size: 20))
                    .foregroundStyle(Color.rpSurface)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 16)
                    .background(Color.rpTextSecondary)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            Spacer()
        }
        .padding()
    }
}
