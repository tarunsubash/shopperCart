//
//  ViewModel.swift
//  shopperCart
//
//  Created by Subash on 20/12/19.
//  Copyright © 2019 Subash. All rights reserved.
//

import Foundation

class ProductListViewModel {
    let productListService: ProductListService = ProductListService()
    
    public func fetchProductList() -> [ProductModel] {
        let productList: [ProductModel] = JSONLoader.loadFromBundle("ProductList")
        print(productList.count)
        return productList
    }
    
    public func fetchProductsFromService(completion: @escaping ([ProductModel]) -> ()) {
        productListService.fetchProductList { (model) in
            completion(model)
        }
    }
}
