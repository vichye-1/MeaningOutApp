//
//  Shopping.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/13/24.
//

import Foundation

struct ShoppingResult: Decodable {
    let total: Int
    let start: Int
    let display: Int
    let items: [Items]
}

struct Items: Decodable {
    let title: String
    let link: String
    let image: String
    let lprice: String
    let mallName: String
}
