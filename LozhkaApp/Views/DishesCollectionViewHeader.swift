//
//  DishesCollectionViewHeader.swift
//  LozhkaApp
//
//  Created by Ирина Улитина on 16/03/2019.
//  Copyright © 2019 Christian Benua. All rights reserved.
//

import Foundation
import UIKit

class DishesCollectionViewHeader: UICollectionViewCell {
    
    let sectionNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.contentView.layer.cornerRadius = 10
        self.contentView.clipsToBounds = true
        self.contentView.backgroundColor = UIColor.init(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 0.7)
        self.contentView.addSubview(sectionNameLabel)
        
        sectionNameLabel.anchor(top: self.contentView.topAnchor, left: self.contentView.leftAnchor, bottom: self.contentView.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
