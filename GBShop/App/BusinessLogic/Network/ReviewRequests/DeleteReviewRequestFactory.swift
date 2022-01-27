//
//  DeleteReviewRequestFactory.swift
//  GBShop
//
//  Created by Павел Шатунов on 27.01.2022.
//

import Foundation
import Alamofire

protocol DeleteReviewRequestFactory {
    func deleteReview(comment: Comment, comletionHandler: @escaping (AFDataResponse<DeleteReviewResult>) -> Void)
}
