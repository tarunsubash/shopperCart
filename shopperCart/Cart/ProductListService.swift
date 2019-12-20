//
//  ProductListService.swift
//  shopperCart
//
//  Created by Subash on 20/12/19.
//  Copyright © 2019 Subash. All rights reserved.
//

import Foundation

class ProductListService {
    let urlString: String = "https://www.mocky.io/v2/5dfb52b12f00005700ff9e46"

    func abc(completion: ([ProductModel]) -> ()) {
        completion([])
    }
    func fetchProductList(completion: @escaping ([ProductModel]) -> ()) {
    
        let url = URL(string: urlString)!
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            guard error == nil else {
                print("error calling service")
                print(error!)
                return
            }
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            guard let productData: [ProductModel] = JSONParser.parse(responseData) else {
                print("error trying to convert data to JSON")
                return
            }
            completion(productData)
        }
        task.resume()
    }
}
