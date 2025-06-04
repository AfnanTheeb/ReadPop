//
//   Article+Mock.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 06/12/1446 AH.
//
import Foundation
@testable import ReadPop

extension Article {
    static let dummy = Article(
        id: "123",
        title: "Dummy Title",
        abstract: "This is a dummy abstract",
        publishedDate: "2025-06-01",
        updated: "2025-06-01T10:00:00",
        byline: "By Dummy",
        url: "https://example.com",
        section: "News",
        subsection: "World",
        nytdsection: "news",
        imageUrl: "https://example.com/image.jpg"
    )
}
