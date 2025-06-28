//
//  Article.swift
//  ReadPopApp
//
//  Created by Afnan Alotaibi on 29/12/1446 AH.
//

import Foundation

public struct Article: Identifiable, Hashable {
    public let id: String
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

public enum ArticlePeriod: Int, CaseIterable {
    case oneDay = 1, sevenDays = 7, thirtyDays = 30

    var title: String {
        switch self {
        case .oneDay: "TODAY'S"
        case .sevenDays: "THIS WEEK"
        case .thirtyDays: "THIS MONTH"
        }
    }
}
