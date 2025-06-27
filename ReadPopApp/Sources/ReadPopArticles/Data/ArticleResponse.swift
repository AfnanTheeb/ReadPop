//
//  ArticleResponse.swift
//  ReadPopApp
//
//  Created by Afnan Alotaibi on 29/12/1446 AH.
//

import Foundation
import ReadPopCore

struct ArticleResponse: Decodable {
    let results: [ArticleDTO]
}

struct ArticleDTO: Decodable {
    let id: Int
    let title: String
    let abstract: String
    let publishedDate: String
    let updated: String
    let byline: String?
    let url: String
    let section: String
    let subsection: String?
    let nytdsection: String?
    let media: [MediaDTO]?

    enum CodingKeys: String, CodingKey {
        case id, title, abstract, updated, byline, url, section, subsection, nytdsection, media
        case publishedDate = "published_date"
    }
}

struct MediaDTO: Decodable {
    let mediaMetadata: [MediaMetadataDTO]?

    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetadataDTO: Decodable {
    let url: String
}

extension ArticleDTO {
    func toDomain() -> Article {
        Article(
            id: String(id),
            title: title,
            abstract: abstract,
            publishedDate: publishedDate.toRelativeDateString(),
            updated: updated,
            byline: byline ?? "",
            url: url,
            section: section,
            subsection: subsection ?? "",
            nytdsection: nytdsection ?? "",
            imageUrl: media?.first?.mediaMetadata?.last?.url
        )
    }
}
