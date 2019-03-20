//
//  Sections.swift
//  LozhkaApp
//
//  Created by Ирина Улитина on 16/03/2019.
//  Copyright © 2019 Christian Benua. All rights reserved.
//

import Foundation
/**
 Reading sections from json
 */
class SectionsReader: Decodable {
    var sections: [String] = []
    
    enum CodingKeys: String, CodingKey {
        case sections = "items"
    }
    
    required init(from decoder: Decoder) {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.sections = try container.decode([String].self, forKey: .sections)
        } catch let err {
            print(err)
        }
    }
}
