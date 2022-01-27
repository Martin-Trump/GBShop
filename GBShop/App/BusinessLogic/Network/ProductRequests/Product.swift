//
//  Product.swift
//  GBShop
//
//  Created by Павел Шатунов on 19.01.2022.
//

import Foundation
import Alamofire

class Product: AbstractRequestFactory {
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    init(
        errorParser: ErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Product {
    struct Product: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"
        let pageNumber: Int
        let categoryId: Int
        var parameters: Parameters {
            return [
                "page_number": pageNumber,
                "id_category": categoryId
            ]
        }
    }
}

extension Product: ProductRequestFactory {
    func loadProduct(page: Int, prodId: Int, completionHandler: @escaping (AFDataResponse<ProductListData>) -> Void) {
        let requestModel = Product(baseUrl: baseUrl, pageNumber: page, categoryId: prodId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}
