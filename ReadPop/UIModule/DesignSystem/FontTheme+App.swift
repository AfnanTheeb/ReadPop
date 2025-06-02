//
//  FontTheme.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 05/12/1446 AH.
//

import Foundation
import SwiftUI

struct FontTheme {

    // MARK: - Section Headers (TODAY'S)
    struct SectionHeader {
        static func primary(size: CGFloat = 28) -> Font {
            .custom("Bebas Neue", size: size)
        }
    }

    // MARK: - Article Title
    struct ArticleTitle {
        static func bold(size: CGFloat = 20) -> Font {
            .custom("Oswald-Bold", size: size)
        }
    }

    // MARK: - Article Summary / Body
    struct SummaryText {
        static func regular(size: CGFloat = 14) -> Font {
            .custom("Inter", size: size)
        }
    }

    // MARK: - Metadata (date, source)
    struct Metadata {
        static func condensed(size: CGFloat = 12) -> Font {
            .custom("Roboto Condensed", size: size)
        }
    }
}
