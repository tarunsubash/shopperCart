//
//  ProductListTableViewCell.swift
//  shopperCart
//
//  Created by Subash on 20/12/19.
//  Copyright © 2019 Subash. All rights reserved.
//

import UIKit

class ProductListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    let userDefaults = UserDefaults.standard
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func stepperValue(_ sender: UIStepper) {
        let qtty = Int(sender.value)
        userDefaults.set(qtty, forKey: "\(stepper.tag)")
        userDefaults.synchronize()
        print("\(stepper.tag): \(userDefaults.integer(forKey: "\(stepper.tag)"))")
        quantityLabel.text = "\(qtty)"
    }
    func configureCell(model: ProductModel) {
        
        productName?.text = model.name
        if let offerPrice = model.offerPrice {
            productPrice?.text = offerPrice
            productPrice?.textColor = .red
        } else {
            productPrice?.text = model.price
            productPrice?.textColor = .black
        }
        let qtty = UserDefaults.standard.integer(forKey: "\(stepper.tag)")
        quantityLabel.text = "\(qtty)"
    }
    
    func configureStepper(value: Double, tag: Int) {
        stepper.value = value
        stepper.tag = tag
    }
    
}
