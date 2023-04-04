//
//  ErrorResponse.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Aung Ko Ko on 29/03/2023.
//

import Foundation

class ErrorResponse: Error {
    var statusCode: Int = 0
    var message: String? = "Server Error"
    var error: Error?
    var errorData: [String: Any]?
}
