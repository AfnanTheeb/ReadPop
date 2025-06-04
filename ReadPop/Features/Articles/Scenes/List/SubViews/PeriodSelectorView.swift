//
//  PeriodSelectorView.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 06/12/1446 AH.
//

import SwiftUI

struct PeriodSelectorView: View {
    @Binding var selectedPeriod: ArticlePeriod

    var body: some View {
        HStack(spacing: 0) {
            ForEach(ArticlePeriod.allCases) { period in
                periodButton(period: period)
            }
        }
        .background(Color.rpSurface)
        .clipShape(RoundedRectangle(cornerRadius: 0))
    }

    private func periodButton(period: ArticlePeriod) -> some View {
        Button(action: {
            withAnimation {
                selectedPeriod = period
            }
        }) {
            Text(period.title)
                .font(.custom("Oswald-Bold", size: 18))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .foregroundColor(selectedPeriod == period ? .white : .primary)
                .background( Color.rpPrimary )
        }
    }
}


//#Preview {
//    PeriodSelectorView()
//}
