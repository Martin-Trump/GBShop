//
//  LogOut.swift
//  GBShop
//
//  Created by Павел Шатунов on 17.01.2022.
//

import Foundation
import Alamofire

class LogOut: AbstractRequestFactory {
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

extension LogOut {
    struct LogOut: RequestRouter {
        let userId: Int
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"
        var parameters: Parameters {
            return [
                "id_user": userId
            ]
        }
    }
}

extension LogOut: LogOutRequestFactory {
    func logout(userId: Int, completionHandler: @escaping (AFDataResponse<LogOutResult>) -> Void) {
        let requestModel = LogOut(userId: userId, baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}
