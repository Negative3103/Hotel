//
//  Hotel.swift
//  Hotel
//
//  Created by Хасан Давронбеков on 12/09/23.
//

import UIKit

struct Hotel {
    let id: Int?
    let name: String?
    let address: String?
    let minimalPrice: Int?
    let priceForIt: String?
    let rating: Int?
    let ratingName: String?
    let imageUrls: [String]?
    let aboutTheHotel: AboutHotel?
}

struct AboutHotel {
    let description: String?
    let peculiarities: [String]?
}
