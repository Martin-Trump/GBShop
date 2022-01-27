//
//  ChangeUserData.swift
//  GBShop
//
//  Created by Павел Шатунов on 17.01.2022.
//

import Foundation
import Alamofire

class ChangeUserData: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/re sponses/")!
    
    init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension ChangeUserData {
    struct ChangeUserData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "changeUserData.json"
        let userId: Int
        let userName: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        var parameters: Parameters {
            return [
                "id_user": userId,
                "username": userName,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": creditCard,
                "bio": bio
            ]
        }
    }
}

extension ChangeUserData: ChangeUserDataFactory {
    func changeData(userData: RegistrationData, completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>) -> Void) {
            let requestModel = ChangeUserData(
                baseUrl: baseUrl,
                userId: userData.userId,
                userName: userData.userName,
                password: userData.password,
                email: userData.email,
                gender: userData.gender,
                creditCard: userData.creditCard,
                bio: userData.bio
            )
            self.request(request: requestModel, completionHandler: completionHandler)
        }
}


