//
//  Dish.swift
//  LozhkaApp
//
//  Created by Ирина Улитина on 16/03/2019.
//  Copyright © 2019 Christian Benua. All rights reserved.
//

import Foundation


class DishContainer: Decodable {
    var dishes: [Dish] = []
    
    enum CodingKeys: String, CodingKey {
        case sections = "items"
    }
    
    required init(from decoder: Decoder) {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.dishes = try container.decode([Dish].self, forKey: .sections)
        } catch let err {
            print(err)
        }
    }
}

class Dish: Codable {
    var name: String
    
    var cost: Double
    
    var section: Int
    
    var grams: [Int]
    
    var kcal: Double
    
    var elements: [Double] //first - proteins, second - fats, third carbohydrates
    
    private var amount: Int
    
    var Amount: Int {
        get {
            return amount
        }
        set {
            if newValue < 0 {
                amount = 0
            }
            else {
                amount = newValue
            }
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case section
        case grams
        case kcal
        case elements
        case cost
    }
    
    required init(from decoder: Decoder) {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.name = try container.decode(String.self, forKey: .name)
            self.section = try container.decode(Int.self, forKey: .section)
            self.grams = try container.decode([Int].self, forKey: .grams)
            self.kcal = try container.decode(Double.self, forKey: .kcal)
            self.elements = try container.decode([Double].self, forKey: .elements)
            self.cost = try container.decode(Double.self, forKey: .cost)
            self.amount = 0
        } catch let err {
            self.name = ""
            self.section = 0
            self.grams = []
            self.kcal = 0
            self.elements = []
            self.cost = 0
            self.amount = 0
            
            print(err)
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.cost, forKey: "cost")
        aCoder.encode(self.section, forKey: "section")
        aCoder.encode(self.grams, forKey: "gramms")
        aCoder.encode(self.kcal, forKey: "kcal")
        aCoder.encode(elements, forKey: "elements")
    }
    
    var proteins: Double {
        get {
            return elements[0]
        }
    }
    
    var fats: Double {
        get {
            return elements[1]
        }
    }
    
    var carbohydrates: Double {
        get {
            return elements[2]
        }
    }
    
    
    
}
