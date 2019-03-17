//
//  DishCollectionViewCell.swift
//  LozhkaApp
//
//  Created by Ирина Улитина on 16/03/2019.
//  Copyright © 2019 Christian Benua. All rights reserved.
//

import Foundation
import UIKit

protocol UpdateSavedDishesDelegate: class {
    func updateDishes()
}

class DishCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var grammsLabel: UILabel!
    @IBOutlet private var costLabel: UILabel!
    @IBOutlet private var addButton: UIButton!
    @IBOutlet private var decreaseButton: UIButton!
    @IBOutlet private var amountLabel: UILabel!
    
    weak var delegate: UpdateSavedDishesDelegate?
    
    private var dish: Dish!
    
    private func updateAmount() {
        self.amountLabel.text = "\(self.dish.amount)"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.addButton.removeTarget(self, action: #selector(addButtonOnClick(_:)), for: .touchUpInside)
        self.decreaseButton.removeTarget(self, action: #selector(decreaseButtonOnClick(_:)), for: .touchUpInside)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addButton.backgroundColor = UIColor(red: 0.19, green: 0.31, blue: 1.00, alpha: 1.0)
        self.decreaseButton.backgroundColor = UIColor(red: 0.19, green: 0.31, blue: 1.00, alpha: 1.0)
        self.addButton.layer.cornerRadius = self.addButton.frame.width / 2
        self.decreaseButton.layer.cornerRadius = self.decreaseButton.frame.width / 2
    }
    
    func configure(dish: Dish) {
        //self.contentView.translatesAutoresizingMaskIntoConstraints = false
        //self.clipsToBounds = true
        //self.layer.cornerRadius = 6
        self.dish = dish
        self.nameLabel.text = dish.name
        self.grammsLabel.text = dish.grams.compactMap({ (el) -> String in
            "\(Int(el))"
        }).joined(separator: "/") + " Гр"
        self.costLabel.text = "\(dish.cost / 100) руб"
        updateAmount()
        self.addButton.addTarget(self, action: #selector(addButtonOnClick(_:)), for: .touchUpInside)
        self.decreaseButton.addTarget(self, action: #selector(decreaseButtonOnClick(_:)), for: .touchUpInside)
        
        //self.backgroundColor = UIColor(red: 65.0 / 1.2 / 255, green: 65.0 / 1.2 / 255, blue: 65.0 / 1.2 / 255, alpha: 1.0)
        self.backgroundView = UIImageView(image: UIImage(named: "Rectangle"))
        self.backgroundView?.layer.cornerRadius = 6
        
        addButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        decreaseButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
    }
    
    @objc private func addButtonOnClick(_ sender: Any?) {
        self.dish.amount += 1
        updateAmount()
        delegate?.updateDishes()
    }
    
    @objc private func decreaseButtonOnClick(_ sender: Any?) {
        self.dish.amount -= 1
        updateAmount()
        delegate?.updateDishes()
    }
}
