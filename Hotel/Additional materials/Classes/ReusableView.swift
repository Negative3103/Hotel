//
//  ReusableView.swift
//  Hotel
//
//  Created by Хасан Давронбеков on 07/09/23.
//

import Foundation
protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
