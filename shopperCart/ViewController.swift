//
//  ViewController.swift
//  shopperCart
//
//  Created by Subash on 20/12/19.
//  Copyright © 2019 Subash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: ProductListViewModel = ProductListViewModel()
    var productList: [ProductModel] = []
    override func viewDidLoad() {
        productList = viewModel.fetchProductsFromService()
        super.viewDidLoad()
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductTableViewCell
        cell.productName?.text = productList[indexPath.row].name
        if let offerPrice = productList[indexPath.row].offerPrice {
            cell.price?.text = offerPrice
            cell.price?.textColor = .red
        } else {
            cell.price?.text = productList[indexPath.row].price
            cell.price?.textColor = .black
        }
        return cell
    }
}
