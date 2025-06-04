//
//  StringRelativeDateTests.swift
//  ReadPopTests
//
//  Created by Afnan Alotaibi on 08/12/1446 AH.
//

import XCTest
@testable import ReadPop

final class StringRelativeDateTests: XCTestCase {
    
    func test_toRelativeDateString_whenDateIsThreeDaysAgo_shouldReturn3d() {
        let threeDaysAgo = formattedDate(daysAgo: 3)
        let result = threeDaysAgo.toRelativeDateString()
        XCTAssertEqual(result, "3d")
    }
    
    func test_toRelativeDateString_whenDateIsTwoWeeksAgo_shouldReturn2w() {
        let twoWeeksAgo = formattedDate(daysAgo: 14)
        let result = twoWeeksAgo.toRelativeDateString()
        XCTAssertEqual(result, "2w")
    }

    func test_toRelativeDateString_whenDateIsThreeMonthsAgo_shouldReturn3mo() {
        let threeMonthsAgo = formattedDate(monthsAgo: 3)
        let result = threeMonthsAgo.toRelativeDateString()
        XCTAssertEqual(result, "3mo")
    }
    
    func test_toRelativeDateString_whenDateIsInvalid_shouldReturnEmptyString() {
        let invalid = "invalid-date"
        let result = invalid.toRelativeDateString()
        XCTAssertEqual(result, "")
    }

    // MARK: - Helpers

    private func formattedDate(daysAgo: Int) -> String {
        let date = Calendar.current.date(byAdding: .day, value: -daysAgo, to: Date())!
        return formatDate(date)
    }

    private func formattedDate(monthsAgo: Int) -> String {
        let date = Calendar.current.date(byAdding: .month, value: -monthsAgo, to: Date())!
        return formatDate(date)
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: date)
    }
}
