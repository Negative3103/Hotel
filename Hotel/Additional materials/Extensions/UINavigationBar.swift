//
//  UINavigationBar.swift
//  Hotel
//
//  Created by Хасан Давронбеков on 12/09/23.
//

import UIKit

extension UINavigationBar {
    func installBlurEffect() {
        barStyle = .default
        barTintColor = UIColor.appColor(.white)
        backgroundColor = UIColor.appColor(.white)
        titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.appColor(.black)]
        
        let backButton = BackBarButtonItem()
        backButton.title = ""
        backButton.tintColor = UIColor.appColor(.black)
        topItem?.backBarButtonItem = backButton
    }
}

class BackBarButtonItem: UIBarButtonItem {
    @available(iOS 14.0, *)
    override var menu: UIMenu? {
        set {}
        get {
            return super.menu
        }
    }
}

