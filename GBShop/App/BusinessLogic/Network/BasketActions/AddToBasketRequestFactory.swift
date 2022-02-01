//
//  AddToBasketRequestFactory.swift
//  GBShop
//
//  Created by Павел Шатунов on 01.02.2022.
//

import Foundation
import Alamofire

protocol AddToBasketRequestFactory {
    func addToBasket(productId: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void)
}
