//
//  UICollectionViewCell+.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/16/24.
//

import UIKit

extension UICollectionViewCell: ReuseidentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
