//
//  MockLoader.swift
//  ReadPopTests
//
//  Created by Afnan Alotaibi on 08/12/1446 AH.
//

import Foundation
import XCTest

extension XCTestCase {
    func loadTestJSON(named name: String) -> Data {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: name, withExtension: "json") else {
            XCTFail("Missing file: \(name).json")
            return Data()
        }
        return (try? Data(contentsOf: url)) ?? Data()
    }
}
