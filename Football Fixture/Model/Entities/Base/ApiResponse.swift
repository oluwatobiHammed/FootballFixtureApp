//
//  ApiResponse.swift
//  Football Fixture
//
//  Created by user on 08/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
public struct ApiResponse<T: Codable>: Codable {
    public var data: T? = nil
    public var error: ApiError? = nil
}
