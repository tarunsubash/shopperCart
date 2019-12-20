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
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func fetchProducts() {
        viewModel.fetchProductsFromService { [unowned self] (model) in
            self.productList = model
            print(self.productList.count)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductTableViewCell
        cell.configureCell(model: productList[indexPath.row])
        return cell
    }
}
