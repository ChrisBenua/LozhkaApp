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
    /**
     Queue for saving to user defaults not in UI thread
    */
    static let savingQueue = DispatchQueue(label: "savingQueue", qos: .background)
    
    /**
     Key for saving dishes data into userDefaults
    */
    static let dishesKey = "DishesKeys1"
    
    /**
     Saves dishes in JSON format into UserDefaults
     
     - Parameter dishes: 2-d array of dishes by days
    */
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
    
    /**
     Fetches dishes from UserDefaults
     
     - returns: tuple of 2-d dishes array and DayByDayDishes object
    */
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
