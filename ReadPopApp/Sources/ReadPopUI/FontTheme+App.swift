//
//  FontTheme.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 05/12/1446 AH.
//

import Foundation
import SwiftUI

public struct FontTheme {

    // MARK: - Section Headers (TODAY'S)
    public struct SectionHeader {
        public static func primary(size: CGFloat = 28) -> Font {
            .custom("BebasNeue-Regular", size: size)
        }
    }

    // MARK: - Article Title
    public struct ArticleTitle {
        public static func bold(size: CGFloat = 20) -> Font {
            .custom("Oswald-Bold", size: size)
        }
    }

    // MARK: - Article Summary / Body
    public struct SummaryText {
        public static func regular(size: CGFloat = 14) -> Font {
            .custom("Inter", size: size)
        }
    }

    // MARK: - Metadata (date, source)
    public struct Metadata {
        public static func condensed(size: CGFloat = 12) -> Font {
            .custom("Roboto-Condensed", size: size)
        }
    }
}
