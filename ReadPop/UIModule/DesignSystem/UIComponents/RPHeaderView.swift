//
//  RPHeaderView.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 05/12/1446 AH.
//

import SwiftUI

enum RPHeaderStyle {
    case main
    case regular
}

struct RPHeaderView: View {
    let headerHeight = UIScreen.main.bounds.height * 0.12
    let title: String
    var style: RPHeaderStyle = .regular
    var onBack: (() -> Void)? = nil
    
    var body: some View {
        ZStack(alignment: .center) {
            Color.clear
                .edgesIgnoringSafeArea(.top)
            
            HStack {
                if let onBack = onBack {
                    Button(action: onBack) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.primary)
                            .padding(10)
                            .background(Color.gray.opacity(0.15))
                            .clipShape(Circle())
                    }
                    .padding(.leading, 20)
                }
                Spacer()
            }
            
            Text(title)
                .font(titleFont)
                .foregroundColor(.rpPrimary)
                .lineLimit(1)
            
        }
        .frame(height: 60)
    }
    
    private var titleFont: Font {
        switch style {
        case .main:
            return FontTheme.ArticleTitle.bold(size: 28)
        case .regular:
            return FontTheme.ArticleTitle.bold(size: 20)
        }
    }
}

