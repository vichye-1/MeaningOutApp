//
//  UITableViewCell+.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/18/24.
//

import UIKit

extension UITableViewCell: ReuseidentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
