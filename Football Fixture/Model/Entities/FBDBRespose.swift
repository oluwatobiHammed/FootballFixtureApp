//
//  FBDBRespose.swift
//  Football Fixture
//
//  Created by user on 10/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation

public struct FBDBRespose: Codable {
    public let statusMessage: String
    
    enum CodingKeys: String, CodingKey {
        case statusMessage = "error"
    }
}

extension FBDBRespose: LocalizedError {
    public var errorDescription: String? {
        return statusMessage
    }
}
