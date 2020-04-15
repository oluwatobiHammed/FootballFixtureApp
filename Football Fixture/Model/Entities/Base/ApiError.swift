//
//  ApiError.swift
//  Football Fixture
//
//  Created by user on 08/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation

public struct ApiError: Codable {
    public let errors: [ErrorMessage]
    public let statusCode: CLong
}
