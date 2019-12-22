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
        fetchProducts()
        super.viewDidLoad()
        let tableViewCell = UINib(nibName: "ProductListTableViewCell", bundle: nil)
        tableView.register(tableViewCell, forCellReuseIdentifier: "Cell")
    }
    
    private func fetchProducts() {
        productList = viewModel.fetchProductList()
//        viewModel.fetchProductsFromService { [unowned self] (model) in
//            self.productList = model
//            print(self.productList.count)
//        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProductListTableViewCell
        let tag = Int(productList[indexPath.row].pid)!
        cell.configureStepper(value: Double(UserDefaults.standard.integer(forKey: "\(tag)")), tag: tag)
        cell.configureCell(model: productList[indexPath.row])
        return cell
    }
}
