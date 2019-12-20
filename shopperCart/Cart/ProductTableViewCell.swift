//
//  ProductTableViewCell.swift
//  shopperCart
//
//  Created by Subash on 20/12/19.
//  Copyright © 2019 Subash. All rights reserved.
//

import Foundation
import UIKit
class ProductTableViewCell: UITableViewCell {
    var productImage: UIImageView?
    var productName: UILabel?
    var price: UILabel?
    
    func configureCell(model: ProductModel) {
        productName?.text = model.name
        if let offerPrice = model.offerPrice {
            price?.text = offerPrice
            price?.textColor = .red
        } else {
            price?.text = model.price
            price?.textColor = .black
        }
    }
}
