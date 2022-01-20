//
//  AnotherData.swift
//  GBShop
//
//  Created by Павел Шатунов on 19.01.2022.
//

import Foundation

struct ProductListData: Codable {
    let page: Int
    let product: ProductData
    
    enum CodingKeys: String, CodingKey {
        case page = "page_number"
        case product
    }
}
