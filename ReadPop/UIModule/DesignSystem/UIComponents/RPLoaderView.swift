//
//  RPLoaderView.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 06/12/1446 AH.
//

import SwiftUI

struct RPLoaderView: View {
    var body: some View {
        VStack {
            Spacer()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .rpPrimary))
                .scaleEffect(1.4)
            Spacer()
        }
    }
}

