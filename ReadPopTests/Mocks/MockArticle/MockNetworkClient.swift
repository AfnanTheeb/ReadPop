//
//  MockNetworkClient.swift
//  ReadPopTests
//
//  Created by Afnan Alotaibi on 06/12/1446 AH.
//

import Foundation
@testable import ReadPop

final class MockNetworkClient: NetworkClientProtocol {
    var mockData: Data?
    var shouldThrowError = false

    func execute<T: Decodable>(_ request: NetworkRequest) async throws -> T {
        if shouldThrowError {
            throw URLError(.notConnectedToInternet)
        }

        guard let data = mockData else {
            throw URLError(.cannotParseResponse)
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
}
