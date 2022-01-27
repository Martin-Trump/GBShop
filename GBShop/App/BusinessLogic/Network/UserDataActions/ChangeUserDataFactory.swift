//
//  ChangeUserDataFactory.swift
//  GBShop
//
//  Created by Павел Шатунов on 17.01.2022.
//

import Foundation
import Alamofire

protocol ChangeUserDataFactory {
    func changeData(userData: RegistrationData, completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>) -> Void)
}
