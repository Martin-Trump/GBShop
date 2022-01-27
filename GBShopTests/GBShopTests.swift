//
//  GBShopTests.swift
//  GBShopTests
//
//  Created by Павел Шатунов on 11.01.2022.
//

import XCTest
@testable import GBShop

class GBShopTests: XCTestCase {
    
    let requestFactory = RequestFactory()
    let review = Review(userId: 123, text: "Текст отзыва")
    
    let userData = RegistrationData(userId: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language")

    func testLogin() {
        let ex = expectation(description: "Expectation of JSON")
        requestFactory.makeAuthRequestFactory()
            .login(userName: "Somebody", password: "mypassword") { (response) in
                switch response.result {
                case .success(let result):
                    XCTAssertEqual(result.result, 1)
                case .failure:
                    XCTFail()
                }
                ex.fulfill()
            }
        wait(for: [ex], timeout: 10.0)
    }
    
    func testRegistration() {
        let ex = expectation(description: "Expectation of JSON ")
            requestFactory.makeRegistrationFactory()
                .registration(userData: userData) { response in
                    XCTAssertNil(response.error)
                    XCTAssertNotNil(response.result)
                    ex.fulfill()
                }
            waitForExpectations(timeout: 10) { (error) in
                if let error = error {
                    XCTFail("error: \(error)")
            }
        }
    }
    
    func testAddReview() {
        let ex = expectation(description: "Expectation of userMessage")
        requestFactory.makeAddReviewRequestFactory()
            .addReview(review: review) { response in
                XCTAssertNil(response.error)
                XCTAssertNotNil(response.result)
                ex.fulfill()
            }
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }
}
