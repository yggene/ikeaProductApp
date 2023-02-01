//
//  TestProducts.swift
//  ikeaProductApp
//
//  Created by Evgeny Alekseev on 31.01.2023.
//

import UIKit

let testProductHemnes = Product(name: "HEMNES", article: "00112233", image: UIImage(named: "hemnes"))
let testProductLakk = Product(name: "LAKK", article: "11223344", image: UIImage(named: "lakk"))
let testProductPax = Product(name: "PAX", article: "22334455", image: UIImage(named: "pax"))

var products: [Product] = [testProductHemnes, testProductLakk, testProductPax]
var searchHistoryList: [Product] = []
var favoritesList: [Product] = [testProductHemnes, testProductLakk]
