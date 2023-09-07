//
//  NotificationCenter.swift
//  Hotel
//
//  Created by Хасан Давронбеков on 07/09/23.
//

import UIKit

enum UserInfoName: String {
    case example
}

extension Notification.Name {
    static let example = Notification.Name("example")

    func post(object: Any? = nil, userInfo: [AnyHashable : Any]? = nil) {
        NotificationCenter.default.post(name: self, object: object, userInfo: userInfo)
    }
    
    @discardableResult
    func onPost(object: Any? = nil, queue: OperationQueue? = nil, using: @escaping (Notification) -> Void) -> NSObjectProtocol {
        return NotificationCenter.default.addObserver(forName: self, object: object, queue: queue, using: using)
    }
}
