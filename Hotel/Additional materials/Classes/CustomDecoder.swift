//
//  CustomDecoder.swift
//  Hotel
//
//  Created by Хасан Давронбеков on 07/09/23.
//

import Foundation

final class CustomDecoder: JSONDecoder {
    override init() {
        super.init()
        keyDecodingStrategy = .convertFromSnakeCase
    }
}
