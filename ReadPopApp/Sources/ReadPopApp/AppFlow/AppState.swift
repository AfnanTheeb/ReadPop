//
//  AppState.swift
//  ReadPopApp
//
//  Created by Afnan Alotaibi on 29/12/1446 AH.
//

import Foundation
import ReadPopArticles

public enum AppState: Hashable {
    case articles
    case articleDetail(Article)
}
