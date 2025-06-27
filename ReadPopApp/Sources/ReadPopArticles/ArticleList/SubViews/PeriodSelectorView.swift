//
//  PeriodSelectorView.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 06/12/1446 AH.
//

import SwiftUI
import ReadPopUI

struct PeriodSelectorView: View {
    @Binding var selectedPeriod: ArticlePeriod
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(ArticlePeriod.allCases) { period in
                periodButton(period: period)
            }
        }
        .background(Color.rpPrimary)
        .clipShape(RoundedCorners(radius: 10, corners: [.topLeft, .topRight]))
    }

    private func periodButton(period: ArticlePeriod) -> some View {
        let isSelected = selectedPeriod == period
        
        return Button(action: {
            withAnimation(.easeInOut(duration: 0.2)) {
                selectedPeriod = period
            }
        }) {
            Text(period.title)
                .font(.custom("Oswald-Bold", size: isSelected ? 20 : 18))
                .foregroundColor(isSelected ? .white : .white.opacity(0.6))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(
                    isSelected
                    ? Color.rpAccentOrange.opacity(0.8)
                    : Color.rpPrimary
                )
        }
    }
}
