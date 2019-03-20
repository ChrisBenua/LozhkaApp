//
//  CartControllerViewModel.swift
//  LozhkaApp
//
//  Created by Ирина Улитина on 17/03/2019.
//  Copyright © 2019 Christian Benua. All rights reserved.
//

import Foundation

/**
 Protocol for handling event, when there are zero items of following dish in cart
 */
protocol UpdateCartDelegate: class {
    func shouldRemoveItemAt(indexPath: IndexPath?)
}

/**
 DataProvider for CartController and its inner logic
 */
class CartControllerViewModel {
    
    /**
     Cost Footer
    */
    weak var footer: TotalCostFooter? {
        didSet {
            footer?.cost = currentCost()
        }
    }
    
    /**
     MainCollectionViewModel for easily pass data
     */
    weak var mainCollectionViewModel: MainCollectionViewModel?
    
    
    /**
     delegate for updating cart content
    */
    weak var delegate: UpdateCartDelegate?

    /**
     Current dishes in cart
    */
    var dishes: [Dish] = [Dish]()
    
    /**
     init with following viewModel
    */
    init(viewModel: MainCollectionViewModel) {
        self.mainCollectionViewModel = viewModel
        for dishArr in viewModel.dishesByDay {
            self.dishes.append(contentsOf: dishArr.filter( {$0.amount > 0} ))
        }
    }
    
    /**
     Calculates current cost in cart
    */
    private func currentCost() -> Double {
        return dishes.reduce(0, { (res, d) -> Double in
            res + d.cost * Double(d.amount)
        }) / 100
    }
}

extension CartControllerViewModel: DishDidChangeDelegate {
    /**
     Delegate function to notify when amount of ordered dish changes
     
     - Parameter dish: dish, that changed
    */
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
