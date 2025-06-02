//
//  Article.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 04/12/1446 AH.
//

import Foundation

struct Article: Identifiable, Hashable {
    let id: String
    let title: String
    let abstract: String
    let publishedDate: String
    let updated: String
    let byline: String
    let url: String
    let section: String
    let subsection: String
    let nytdsection: String
    let imageUrl: String?
}

enum ArticlePeriod: Int, CaseIterable, Identifiable {
    case oneDay = 1
    case sevenDays = 7
    case thirtyDays = 30

    var id: Int { rawValue }

    var title: String {
        switch self {
        case .oneDay: return "TODAY'S"
        case .sevenDays: return "THIS WEEK"
        case .thirtyDays: return "THIS MONTH"
        }
    }
    
    static var `default`: ArticlePeriod { .sevenDays }
}
