//
//  SectionFilterView.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 13/12/1446 AH.
//

import SwiftUI
import ReadPopUI

struct SectionFilterView: View {
    @ObservedObject var viewModel: ArticleListViewModel
    private let scrollToTopID = "SectionScrollStart"
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    Color.clear
                        .frame(width: 0.3, height: 1)
                        .id(scrollToTopID)
                    
                    filterButton(
                        label: "All",
                        isSelected: viewModel.selectedSection == nil
                    ) {
                        if viewModel.selectedSection != nil {
                            viewModel.selectedSection = nil
                        }
                    }
                    
                    ForEach(viewModel.availableSections, id: \.self) { section in
                        filterButton(
                            label: section.capitalized,
                            isSelected: viewModel.selectedSection == section
                        ) {
                            if viewModel.selectedSection != section {
                                viewModel.selectedSection = section
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 6)
            }
            .onChange(of: viewModel.selectedPeriod) { _ in
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
