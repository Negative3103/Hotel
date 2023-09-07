//
//  Coordinator.swift
//  Hotel
//
//  Created by Хасан Давронбеков on 07/09/23.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
