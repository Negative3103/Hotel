//
//  HotelViewController.swift
//  Hotel
//
//  Created by Хасан Давронбеков on 07/09/23.
//

import UIKit

final class HotelViewController: UIViewController, ViewSpecificController, AlertViewController {
    
    //MARK: - Root View
    typealias RootView = HotelView
    
    //MARK: - Services
    private var viewModel = HotelViewModel()
    var isLoading: Bool = false
    var customSpinnerView = CustomSpinnerView()
    
    //MARK: - Attributes
    private var dataProvider = ComfortsDataProvider()
    private var imagesDataProvider = ImagesDataProvider()
    
    //MARK: - Actions
    @IBAction func buttonAction(_ sender: Button) {
        
    }
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
        viewModel.hotel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
}

//MARK: - Networking
extension HotelViewController: HotelViewModelProtocol {
    func didFinishFetch(hotel: Hotel) {
        view().hotel = hotel
        dataProvider.items = hotel.aboutTheHotel?.peculiarities ?? []
        imagesDataProvider.items = hotel.imageUrls ?? []
    }
}
    
//MARK: - Other funcs
extension HotelViewController {
    private func appearanceSettings() {
        viewModel.delegate = self
        dataProvider.viewController = self
        dataProvider.collectionView = view().collectionView
        
        imagesDataProvider.viewController = self
        imagesDataProvider.collectionView = view().imagesCollectionView
    }
}
