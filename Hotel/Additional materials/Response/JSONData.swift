//
//  JSONData.swift
//  Hotel
//
//  Created by Хасан Давронбеков on 07/09/23.
//

import Foundation

struct JSONData<T: Decodable>: Decodable {
    let code: Int
    let message: String
    let language: String?
    let meta: Meta?
    
    let data: T?
}
