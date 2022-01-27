//
//  ProductRequestFactory.swift
//  GBShop
//
//  Created by Павел Шатунов on 19.01.2022.
//

import Foundation
import Alamofire

protocol ProductRequestFactory {
    func loadProduct(page: Int, prodId: Int, completionHandler: @escaping (AFDataResponse<ProductListData>) -> Void)
}
