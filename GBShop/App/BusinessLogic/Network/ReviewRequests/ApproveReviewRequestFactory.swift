//
//  ApproveResultRequestFfctory.swift
//  GBShop
//
//  Created by Павел Шатунов on 27.01.2022.
//

import Foundation
import Alamofire

protocol ApproveReviewRequestFactory {
    func approveReview(comment: Comment, completionHandler: @escaping (AFDataResponse<ApproveReviewResult>) -> Void)
}
