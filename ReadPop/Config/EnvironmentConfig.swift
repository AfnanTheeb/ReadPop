//
//  EnvironmentConfig.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 04/12/1446 AH.
//

import Foundation

enum EnvironmentConfig {
    static var baseURL: URL {
        guard let urlString = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String,
              let url = URL(string: urlString) else {
            fatalError(" BASE_URL not set")
        }
        return url
    }

    static var apiKey: String {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "NYT_API_KEY") as? String else {
            fatalError(" NYT_API_KEY not set")
        }
        return key
    }
}
