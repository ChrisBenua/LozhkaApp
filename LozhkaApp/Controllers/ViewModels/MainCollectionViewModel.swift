//
//  MainCollectionViewModel.swift
//  LozhkaApp
//
//  Created by Ирина Улитина on 16/03/2019.
//  Copyright © 2019 Christian Benua. All rights reserved.
//

import Foundation

class DataHolder {
    public static var DishesJSON = """

                                    
                                    {
                                    "count": 2,
                                    "items": [
                                    {
                                    "name": "Бургер",
                                    "cost": 9900,
                                    "section": 0,
                                    "grams": [100],
                                    "kcal": 100,
                                    "elements": [18, 11, 20]
                                    },
                                    {
                                    "name": "Тортик",
                                    "cost": 99900,
                                    "section": 1,
                                    "grams": [100],
                                    "kcal": 100,
                                    "elements": [3, 5, 7]
                                    }
                                    ]
                                    }


                                    """
    
    public static var sectionsJSON = """
                                     {
                                     "count": 2,
                                     "items": ["Бургеры", "Десерты"]
                                     }
                                     """


}

class MainCollectionViewModel {
    
    var dishes: [Dish] = []
    
    var groupedDishes: [[Dish]] = [[]]
    
    var sectionNames: [String] = []
    
    init() {
        
        do {
            let sections: SectionsReader = try JSONDecoder().decode(SectionsReader.self, from: DataHolder.sectionsJSON.data(using: .utf8)!)
            self.sectionNames = sections.sections
            self.dishes = (try JSONDecoder().decode(DishContainer.self, from: DataHolder.DishesJSON.data(using: .utf8)!)).dishes
            
            for _ in 0..<sectionNames.count {
                groupedDishes.append([])
            }
            
            for el in dishes {
                groupedDishes[el.section].append(el)
            }
        } catch let err {
            print(err)
        }
    }
}
