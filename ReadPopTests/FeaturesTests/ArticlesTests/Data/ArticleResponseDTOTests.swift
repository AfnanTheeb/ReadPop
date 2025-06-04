//
//  ArticleResponseDTOTests.swift
//  ReadPopTests
//
//  Created by Afnan Alotaibi on 08/12/1446 AH.
//

import XCTest
@testable import ReadPop

final class ArticleDTOTests: XCTestCase {
    
    func test_toDomain_shouldMapAllFieldsCorrectly() {
        // Arrange
        let dto = ArticleDTO(
            id: 101,
            title: "Swift 6 Announced",
            abstract: "Big update from Apple",
            publishedDate: "2025-06-01",
            updated: "2025-06-01T10:00:00",
            byline: "By Afnan",
            url: "https://example.com/swift6",
            section: "Tech",
            subsection: "iOS",
            nytdsection: "tech",
            media: [
                MediaDTO(mediaMetadata: [
                    MediaMetadataDTO(url: "https://example.com/image1.jpg"),
                    MediaMetadataDTO(url: "https://example.com/image2.jpg")
                ])
            ]
        )
        
        // Act
        let model = dto.toDomain()
        
        // Assert
        XCTAssertEqual(model.id, "101")
        XCTAssertEqual(model.title, dto.title)
        XCTAssertEqual(model.abstract, dto.abstract)
        XCTAssertEqual(model.publishedDate, dto.publishedDate.toRelativeDateString())
        XCTAssertEqual(model.updated, dto.updated)
        XCTAssertEqual(model.byline, dto.byline)
        XCTAssertEqual(model.url, dto.url)
        XCTAssertEqual(model.section, dto.section)
        XCTAssertEqual(model.subsection, dto.subsection)
        XCTAssertEqual(model.nytdsection, dto.nytdsection)
        XCTAssertEqual(model.imageUrl, "https://example.com/image2.jpg")
    }
    
    func test_toDomain_shouldHandleNilOptionalFields() {
        // Arrange
        let dto = ArticleDTO(
            id: 200,
            title: "Title",
            abstract: "Abstract",
            publishedDate: "2025-06-01",
            updated: "2025-06-01T10:00:00",
            byline: nil,
            url: "https://example.com",
            section: "Section",
            subsection: nil,
            nytdsection: nil,
            media: nil
        )
        
        // Act
        let model = dto.toDomain()
        
        // Assert
        XCTAssertEqual(model.id, "200")
        XCTAssertEqual(model.byline, "")
        XCTAssertEqual(model.subsection, "")
        XCTAssertEqual(model.nytdsection, "")
        XCTAssertNil(model.imageUrl)
    }
}
