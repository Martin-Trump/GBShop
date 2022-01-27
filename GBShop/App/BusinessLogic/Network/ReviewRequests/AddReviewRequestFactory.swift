//
//  AddReviewRequestFactory.swift
//  GBShop
//
//  Created by Павел Шатунов on 27.01.2022.
//

import Foundation
import Alamofire

protocol AddReviewRequestFactory {
    func addReview(review: Review, completionHandler: @escaping(AFDataResponse<ReviewResult>) -> Void)
}
