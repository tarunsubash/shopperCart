//
//  ProductModel.swift
//  shopperCart
//
//  Created by Subash on 20/12/19.
//  Copyright © 2019 Subash. All rights reserved.
//

import Foundation

class ProductModel: Codable {
    let name: String
    let price: String
    let image: String
    let offerPrice: String?
    let pid: String
}
