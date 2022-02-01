//
//  DeleteFromBasketRequestFactory.swift
//  GBShop
//
//  Created by Павел Шатунов on 01.02.2022.
//

import Foundation
import Alamofire

protocol DeleteFromBasketRequestFactory  {
    func deleteFromBasket(productId: Int, completionHandler: @escaping(AFDataResponse<DeleteFromBasketResult>) -> Void)
}
