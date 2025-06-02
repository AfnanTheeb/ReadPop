//
//  AppState.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 04/12/1446 AH.
//

import Foundation

enum AppState: Hashable {
    case articles
    case articleDetail(Article)
    // such as login, profile
}
