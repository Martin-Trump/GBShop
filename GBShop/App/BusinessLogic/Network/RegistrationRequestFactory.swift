//
//  RegistrationRequestFactory.swift
//  GBShop
//
//  Created by Павел Шатунов on 18.01.2022.
//

import Foundation
import Alamofire

protocol RegistrationRequestFactory {
    func registration(userData: RegistrationData, completionHandler: @escaping (AFDataResponse<Registration>) -> Void)
}
