//
//  String+Extensions.swift
//  ReadPopApp
//
//  Created by Afnan Alotaibi on 29/12/1446 AH.
//


import Foundation

public extension String {
    /// Converts a "yyyy-MM-dd" string to a relative time string like "2d", "1w", or "3mo".
    func toRelativeDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US_POSIX")

        guard let date = formatter.date(from: self) else { return "" }

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
