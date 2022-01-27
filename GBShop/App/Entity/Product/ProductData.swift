//
//  CatalogData.swift
//  GBShop
//
//  Created by Павел Шатунов on 19.01.2022.
//

import Foundation

struct ProductData: Codable {
    let productId: Int
    let name: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case productId = "id_pdoduct"
        case name = "product_name"
        case price
    }
}
