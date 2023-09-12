//
//  HotelView.swift
//  Hotel
//
//  Created by Хасан Давронбеков on 07/09/23.
//

import UIKit
import SkeletonView

final class HotelView: CustomView {
    
    //MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pageControl: SnakePageControl!
    @IBOutlet weak var priceForItLabel: UILabel!
    @IBOutlet weak var imagesCollectionView: UICollectionView! {
        didSet {
            imagesCollectionView.register(UINib(nibName: ImagesCollectionViewCell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: ImagesCollectionViewCell.defaultReuseIdentifier)
        }
    }
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: ComfortsCollectionViewCell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: ComfortsCollectionViewCell.defaultReuseIdentifier)
        }
    }
    
    //MARK: - Attributes
    internal var hotel: Hotel? {
        didSet {
            guard let hotel = hotel else { return }
            titleLabel.text = hotel.name
            addressLabel.text = hotel.address
            priceLabel.text = "от \(hotel.minimalPrice ?? 0) Р"
            priceForItLabel.text = hotel.priceForIt
            descriptionLabel.text = hotel.aboutTheHotel?.description
            ratingLabel.text = "\(hotel.rating ?? 0) " + (hotel.ratingName ?? "")
        }
    }
}
