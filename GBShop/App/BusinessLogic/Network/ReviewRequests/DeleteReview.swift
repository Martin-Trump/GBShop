//
//  DeleteReview.swift
//  GBShop
//
//  Created by Павел Шатунов on 27.01.2022.
//

import Foundation
import Alamofire

class DeleteReview: AbstractRequestFactory {
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

extension DeleteReview {
    struct DeleteReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "deleteReview.json"
        let commentId: Int
        
        var parameters: Parameters {
            return [
                "id_comment": commentId
            ]
        }
    }
}

extension DeleteReview: DeleteReviewRequestFactory {
    func deleteReview(comment: Comment, comletionHandler: @escaping (AFDataResponse<DeleteReviewResult>) -> Void) {
        let requestModel = DeleteReview(baseUrl: baseUrl, commentId: comment.commentId)
        self.request(request: requestModel, completionHandler: comletionHandler)
    }
}


