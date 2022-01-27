//
//  AddReview.swift
//  GBShop
//
//  Created by Павел Шатунов on 27.01.2022.
//

import Foundation
import Alamofire

class AddReview: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension AddReview {
    struct AddReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "addReview.json"
        let userId: Int
        let text: String
        
        var parameters: Parameters {
            return [
                "id_user": userId,
                
                "text" : text

            ]
        }
    }
}

extension AddReview: AddReviewRequestFactory {
    func addReview(review: Review, completionHandler: @escaping (AFDataResponse<ReviewResult>) -> Void) {
        let requestModel = AddReview(baseUrl: baseUrl, userId: review.userId, text: review.text)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}
