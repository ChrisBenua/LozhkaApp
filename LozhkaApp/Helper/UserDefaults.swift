//
//  UserDefaults.swift
//  LozhkaApp
//
//  Created by Ирина Улитина on 16/03/2019.
//  Copyright © 2019 Christian Benua. All rights reserved.
//

import Foundation
import UIKit

extension UserDefaults {
    static let savingQueue = DispatchQueue(label: "savingQueue", qos: .background)
    static let dishesKey = "DishesKeys1"
    
    func saveDishes(dishes: DayByDayDishes) {
        UserDefaults.savingQueue.async {
            do {
                let data = try JSONEncoder().encode(dishes)
                UserDefaults.standard.set(data, forKey: UserDefaults.dishesKey)
            } catch let err {
                print(err)
            }
        }
    }
    
    func getSavedDishes() -> ([[Dish]], DayByDayDishes)? {
        guard let data = UserDefaults.standard.data(forKey: UserDefaults.dishesKey) else { return nil }
        do {
            let dishes = try JSONDecoder().decode(DayByDayDishes.self, from: data)
            
            var ans = [[Dish]]()
            
            for dishContainer in dishes.dishes {
                ans.append([])
                for dish in dishContainer.dishes {
                    ans[ans.count - 1].append(dish)
                }
            }
        
            return (ans, dishes)
        } catch let err {
            print(err)
            return nil
        }
    }
}
