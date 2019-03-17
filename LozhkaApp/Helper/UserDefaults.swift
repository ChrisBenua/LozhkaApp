//
//  UserDefaults.swift
//  LozhkaApp
//
//  Created by Ирина Улитина on 16/03/2019.
//  Copyright © 2019 Christian Benua. All rights reserved.
//

import Foundation


extension UserDefaults {
    static let dishesKey = "DishesKeys1"
    
    /*func saveDishes(dishes: DayByDayDishes) {
        let data = JSONEncoder().encode(DayByDayDishes.self)
        UserDefaults.standard.set(data, forKey: UserDefaults.dishesKey)
    }
    
    func getSavedDishes() -> [[Dish]]? {
        guard let data = UserDefaults.standard.data(forKey: UserDefaults.dishesKey) else { return nil }
        do {
            let dishes = try (NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [[Dish]])
        
        return dishes
        } catch let err {
            print(err)
            return nil
        }
    }*/
}
