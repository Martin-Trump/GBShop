//
//  AbstractErrorParser.swift
//  GBShop
//
//  Created by Павел Шатунов on 13.01.2022.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
