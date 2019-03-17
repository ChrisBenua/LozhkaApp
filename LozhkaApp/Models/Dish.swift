//
//  Dish.swift
//  LozhkaApp
//
//  Created by Ирина Улитина on 16/03/2019.
//  Copyright © 2019 Christian Benua. All rights reserved.
//

import Foundation

class DayByDayDishes: Codable {
    var dishes: [DishContainer] = []
    
    enum CodingKeys: String, CodingKey {
        case dishes = "items"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.dishes = try values.decode([DishContainer].self, forKey: .dishes)
    }
    
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(dishes, forKey: .dishes)
        
    }
}

class DishContainer: Codable {
    var dishes: [Dish] = []
    
    enum CodingKeys: String, CodingKey {
        case dishes = "items"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.dishes = try values.decode([Dish].self, forKey: .dishes)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(dishes, forKey: .dishes)
    }
}

class Dish: Codable, Equatable {
    static func == (lhs: Dish, rhs: Dish) -> Bool {
        return (lhs.name == rhs.name && lhs.section == rhs.section)
    }
    
    var name: String
    
    var cost: Double
    
    var section: Int
    
    var grams: [Double]
    
    var amount: Int {
        didSet {
            if amount < 0 {
                amount = 0
            }
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case section
        case grams
        //case kcal
        //case elements
        case cost
        case amount
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try values.decode(String.self, forKey: .name)
        self.section = try values.decode(Int.self, forKey: .section)
        self.grams = try values.decode([Double].self, forKey: .grams)
        do {
            let amnt: Int = try values.decode(Int.self, forKey: .amount)
            self.amount = amnt
        } catch let err {
            self.amount = 0
        }
        self.cost = try values.decode(Double.self, forKey: .cost)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.section, forKey: .section)
        try container.encode(self.cost, forKey: .cost)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.grams, forKey: .grams)
    }
    
    init(name: String, cost: Double, section: Int, grams: [Double], amount: Int) {
        self.name = name
        self.cost = cost
        self.section = section
        self.grams = grams
        self.amount = amount
    }
}
