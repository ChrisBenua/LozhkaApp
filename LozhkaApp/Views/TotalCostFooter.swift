//
//  TotalCostFooter.swift
//  LozhkaApp
//
//  Created by Ирина Улитина on 17/03/2019.
//  Copyright © 2019 Christian Benua. All rights reserved.
//

import Foundation
import UIKit


class TotalCostFooter: UICollectionViewCell {
    let costLabel: UILabel = {
        let l = UILabel()
        //l.font = UIFont.systemFont(ofSize: 18)
        
        return l
    }()
    
    var cost: Double = 0 {
        didSet {
            
            let attributedText = NSMutableAttributedString(string: "Итого: ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.white])
            attributedText.append(NSAttributedString(string: "\(Int(cost)) руб", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.lightText]))
            
            costLabel.attributedText = attributedText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(costLabel)
        costLabel.anchor(top: self.contentView.topAnchor, left: self.contentView.leftAnchor, bottom: self.contentView.bottomAnchor, right: self.contentView.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 10, paddingRight: 20, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.contentView.addSubview(costLabel)
        costLabel.anchor(top: self.contentView.topAnchor, left: self.contentView.leftAnchor, bottom: self.contentView.bottomAnchor, right: self.contentView.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 10, paddingRight: 20, width: 0, height: 0)
    }
    
}
