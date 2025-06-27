//
//  EnvironmentConfig.swift
//  ReadPopApp
//
//  Created by Afnan Alotaibi on 01/01/1447 AH.
//

import Foundation

public struct EnvironmentConfig {
    public static func value(for key: EnvironmentKey) -> String {
        guard let value = Bundle.main.infoDictionary?[key.rawValue] as? String else {
            fatalError("\(key.rawValue) is not set in Info.plist")
        }
        return value
    }

    public static var baseURL: URL {
        guard let url = URL(string: value(for: .baseURL)) else {
            fatalError("Invalid BASE_URL format")
        }
        return url
    }

    public static var apiKey: String {
        value(for: .apiKey)
    }

    public static var environment: Environment {
        Environment(rawValue: value(for: .appEnvironment)) ?? .dev
    }
}

public enum Environment: String {
    case dev = "Dev"
    case staging = "Staging"
    case production = "Production"

    public var isProduction: Bool {
        self == .production
    }
}
