//
//  SectionFilterView.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 13/12/1446 AH.
//

import SwiftUI
import ReadPopUI

struct SectionFilterView: View {
    let availableSections: [String]
    var selectedSection: String
    let onSelect: (String) -> Void
    private let scrollToTopID = "SectionScrollStart"
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    Color.clear
                        .frame(width: 0.3, height: 1)
                        .id(scrollToTopID)
                    
                    ForEach(availableSections, id: \.self) { section in
                        filterButton(
                            label: section.capitalized,
                            isSelected: selectedSection == section
                        ) {
                            onSelect(section)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 6)
            }
            .onChange(of: availableSections ) { _ in
                withAnimation {
                    proxy.scrollTo(scrollToTopID, anchor: .leading)
                }
            }
        }
    }
    
    @ViewBuilder
    private func filterButton(label: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(label)
                .font(FontTheme.Metadata.condensed(size: 14))
                .foregroundColor(isSelected ? .white : .rpTextSecondary.opacity(0.7))
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(isSelected ? Color.rpPrimary : Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(isSelected ? Color.rpPrimary : Color.rpTextSecondary.opacity(0.7), lineWidth: 1)
                        )
                )
        }
        .animation(.easeInOut(duration: 0.2), value: isSelected)
    }
}
