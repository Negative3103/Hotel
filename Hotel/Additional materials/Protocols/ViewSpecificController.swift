//
//  ViewSpecificController.swift
//  Hotel
//
//  Created by Хасан Давронбеков on 07/09/23.
//

import UIKit

protocol ViewSpecificController {
    associatedtype RootView: UIView
}

extension ViewSpecificController where Self: UIViewController {
    func view() -> RootView {
        return self.view as! RootView
    }
}
