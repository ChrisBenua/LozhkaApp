//
//  CartControllerViewModel.swift
//  LozhkaApp
//
//  Created by Ирина Улитина on 17/03/2019.
//  Copyright © 2019 Christian Benua. All rights reserved.
//

import Foundation

protocol UpdateCartDelegate: class {
    func shouldRemoveItemAt(indexPath: IndexPath?)
}

class CartControllerViewModel {
    
    weak var footer: TotalCostFooter? {
        didSet {
            footer?.cost = currentCost()
        }
    }
    
    weak var mainCollectionViewModel: MainCollectionViewModel?
    
    weak var delegate: UpdateCartDelegate?
    
    var dishes: [Dish] = [Dish]()
    
    init(viewModel: MainCollectionViewModel) {
        self.mainCollectionViewModel = viewModel
        for dishArr in viewModel.dishesByDay {
            self.dishes.append(contentsOf: dishArr.filter( {$0.amount > 0} ))
        }
    }
    
    private func currentCost() -> Double {
        return dishes.reduce(0, { (res, d) -> Double in
            res + d.cost * Double(d.amount)
        }) / 100
    }
}

extension CartControllerViewModel: DishDidChangeDelegate {
    func dishDidChange(dish: Dish) {
        
        mainCollectionViewModel?.updateDishes()
        
        footer?.cost = currentCost()
        
        if dish.amount <= 0 {
            guard let index = dishes.index(of: dish) else { return }
            self.dishes.remove(at: index)
            delegate?.shouldRemoveItemAt(indexPath: IndexPath(item: index, section: 0))
        } else {
            delegate?.shouldRemoveItemAt(indexPath: nil)
        }
    }
    
}
