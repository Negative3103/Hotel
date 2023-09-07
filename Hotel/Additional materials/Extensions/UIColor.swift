//
//  UIColor.swift
//  Hotel
//
//  Created by Хасан Давронбеков on 07/09/23.
//

import UIKit

extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor {
        return UIColor(named: name.rawValue) ?? .clear
    }
}
