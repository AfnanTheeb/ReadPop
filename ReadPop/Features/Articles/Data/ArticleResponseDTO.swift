//
//  ArticleResponseDTO.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 04/12/1446 AH.
//

import Foundation

// MARK: Response Wrapper
struct ArticleResponseDTO: Decodable {
    let results: [ArticleDTO]
}

// MARK: Article DTO
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
    
//    func toDomain() -> Article {
//        Article(
//            id: String(id),
//            title: title,
//            abstract: abstract,
//            publishedDate: formatDate(publishedDate),
//            updated: updated,
//            byline: byline ?? "",
//            url: url,
//            section: section,
//            subsection: subsection ?? "",
//            nytdsection: nytdsection ?? "",
//            imageUrl: media?.first?.mediaMetadata?.last?.url
//        )
//    }
    
    private func formatDate(_ dateString: String?) -> String {
        guard let dateString = dateString else { return "" }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = formatter.date(from: dateString) else { return "" }
        
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.day, .weekOfYear, .month], from: date, to: now)
        
        if let month = components.month, month > 0 {
            return "\(month)mo"
        } else if let week = components.weekOfYear, week > 0 {
            return "\(week)w"
        } else if let day = components.day {
            return "\(day)d"
        } else {
            return "1d"
        }
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
            publishedDate: publishedDate,
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
