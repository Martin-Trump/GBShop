//
//  LogOutRequestFactory.swift
//  GBShop
//
//  Created by Павел Шатунов on 17.01.2022.
//

import Foundation
import Alamofire

protocol LogOutRequestFactory {
    func logout(userId: Int, completionHandler: @escaping (AFDataResponse<LogOutResult>) -> Void)
}
