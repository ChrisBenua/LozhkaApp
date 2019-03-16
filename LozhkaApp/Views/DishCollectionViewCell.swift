//
//  DishCollectionViewCell.swift
//  LozhkaApp
//
//  Created by Ирина Улитина on 16/03/2019.
//  Copyright © 2019 Christian Benua. All rights reserved.
//

import Foundation
import UIKit

class DishCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var grammsLabel: UILabel!
    @IBOutlet private var costLabel: UILabel!
    @IBOutlet private var addButton: UIButton!
    @IBOutlet private var decreaseButton: UIButton!
    @IBOutlet private var amountLabel: UILabel!
    
    private var dish: Dish!
    
    private func updateAmount() {
        self.amountLabel.text = "\(self.dish.Amount)"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.addButton.removeTarget(self, action: #selector(addButtonOnClick(_:)), for: .touchUpInside)
        self.decreaseButton.removeTarget(self, action: #selector(decreaseButtonOnClick(_:)), for: .touchUpInside)
        
    }
    
    func configure(dish: Dish) {
        self.dish = dish
        self.nameLabel.text = dish.name
        self.grammsLabel.text = dish.grams.compactMap({ (el) -> String in
            "\(el)"
        }).joined(separator: "/") + " Гр"
        self.costLabel.text = "\(dish.cost / 100) руб"
        updateAmount()
        self.addButton.addTarget(self, action: #selector(addButtonOnClick(_:)), for: .touchUpInside)
        self.decreaseButton.addTarget(self, action: #selector(decreaseButtonOnClick(_:)), for: .touchUpInside)
        
        self.backgroundView = UIImageView(image: UIImage(named: "grad.png"))
        self.backgroundView?.layer.cornerRadius = 8
        self.backgroundView?.clipsToBounds = true
        
        addButton.setImage(UIImage(named: "plusButton"), for: .normal)
        decreaseButton.setImage(UIImage(named: "minusButton"), for: .normal)
        
        addButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        decreaseButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        
        addButton.imageView?.tintColor = UIColor.white
        decreaseButton.imageView?.tintColor = UIColor.white
    }
    
    @objc private func addButtonOnClick(_ sender: Any?) {
        self.dish.Amount += 1
        updateAmount()
    }
    
    @objc private func decreaseButtonOnClick(_ sender: Any?) {
        self.dish.Amount -= 1
        updateAmount()
    }
}
