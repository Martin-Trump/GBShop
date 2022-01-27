//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Павел Шатунов on 15.01.2022.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}
