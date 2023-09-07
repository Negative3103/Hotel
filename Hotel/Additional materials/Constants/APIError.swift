//
//  APIError.swift
//  Hotel
//
//  Created by Хасан Давронбеков on 07/09/23.
//

import Foundation

enum Result<T> {
    case Success(T)
    case Error(APIError, String? = nil)
}

enum APIError: Error {
    case requestFailed
    case invalidData
    case responseUnsuccessful
    case serverError
    case notAuthorized
    case fromMessage
    case notEnoughBalance
}
