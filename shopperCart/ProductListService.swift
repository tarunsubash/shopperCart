//
//  ProductListService.swift
//  shopperCart
//
//  Created by Subash on 20/12/19.
//  Copyright © 2019 Subash. All rights reserved.
//

import Foundation

class ProductListService {
    let urlString: String = "http://www.mocky.io/v2/5dfb52b12f00005700ff9e46"
    
    func fetchProductList() -> [ProductModel] {
        var productList: [ProductModel] = []
        if let url = URL(string: urlString) {
            let urlSession = URLSession()
            urlSession.dataTask(with: url) { (data, response, error) in
            }
        }
        return productList
    }
}
