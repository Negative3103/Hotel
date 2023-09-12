//
//  HotelViewModel.swift
//  Hotel
//
//  Created by Хасан Давронбеков on 12/09/23.
//

import UIKit

protocol HotelViewModelProtocol: ViewModelProtocol {
    func didFinishFetch(hotel: Hotel)
}

final class HotelViewModel {
    
    // MARK: - Attributes
    weak var delegate: HotelViewModelProtocol?
    
    // MARK: - Network call
    internal func hotel() {
        delegate?.showActivityIndicator()
        JSONDownloader.shared.jsonTask(requestMethod: .get, completionHandler: { [weak self]  (result) in
            guard let self = self else { return }
            switch result {
            case .Error(let error):
                self.delegate?.showAlertClosure(error: error)
            case .Success(let json):
                do {
                    if let json = try JSONSerialization.jsonObject(with: json, options: []) as? [String: Any] {
                        guard let id = json["id"] as? Int,
                              let name = json["name"] as? String,
                              let address = json["adress"] as? String,
                              let minimalPrice = json["minimal_price"] as? Int,
                              let priceForIt = json["price_for_it"] as? String,
                              let rating = json["rating"] as? Int,
                              let ratingName = json["rating_name"] as? String,
                              let imageUrls = json["image_urls"] as? [String],
                              let aboutHotel = json["about_the_hotel"] as? [String: Any],
                              let description = aboutHotel["description"] as? String,
                              let peculiarities = aboutHotel["peculiarities"] as? [String] else { return }
                        self.delegate?.didFinishFetch(hotel: Hotel(id: id, name: name, address: address, minimalPrice: minimalPrice, priceForIt: priceForIt, rating: rating, ratingName: ratingName, imageUrls: imageUrls, aboutTheHotel: AboutHotel(description: description, peculiarities: peculiarities)))
                    }
                } catch {
                    self.delegate?.showAlertClosure(error: (APIError.invalidData, nil))
                }
            }
            self.delegate?.hideActivityIndicator()
        })
    }
}
