//
//  Product.swift
//  ikeaProductApp
//
//  Created by Evgeny Alekseev on 29.01.2023.
//

import UIKit

struct Product {
    var name: String
    var article: String
    var image: UIImage?
}

extension Product: Equatable {
    static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.article == rhs.article
    }
}
