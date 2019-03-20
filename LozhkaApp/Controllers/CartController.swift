//
//  CartController.swift
//  LozhkaApp
//
//  Created by Ирина Улитина on 17/03/2019.
//  Copyright © 2019 Christian Benua. All rights reserved.
//

import Foundation
import UIKit

class CartCollectionViewController: UICollectionViewController {
    
    var viewModel: CartControllerViewModel? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = UIColor(red: 0.15, green: 0.05, blue: 0.02, alpha: 1.0)
        
        self.viewModel?.delegate = self
        self.collectionView.register(UINib(nibName: "DishCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CELLID")
        self.collectionView.register(TotalCostFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "FOOTERID")
        
        self.collectionView.register(DishesCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HEADERID")
        
        
        self.navigationItem.title = "Корзина"
        //self.navigationItem.leftBarButtonItem?.title = ""
    }
}

//MARK:- DataSource
extension CartCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(self.collectionView.frame)
        return self.viewModel?.dishes.count ?? 0
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "CELLID", for: indexPath) as! DishCollectionViewCell
        cell.didChandeDelegate = self.viewModel
        cell.configure(dish: self.viewModel!.dishes[indexPath.row])
        cell.didChandeDelegate = self.viewModel
        
        return cell
    }
}

//MARK:- FlowLayout
extension CartCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = viewModel!.dishes[indexPath.row].name
        
        
        //let gramsWidth = grams.widthWithConstrainedHeight(height: 40, font: UIFont.systemFont(ofSize: 17))
        
        return CGSize(width: self.view.frame.width - 10, height: text.heightWithConstrainedWidth(width: (self.view.frame.width - 20 - 36), font: UIFont.systemFont(ofSize: 19)) + 102)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 20)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionView.elementKindSectionFooter) {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "FOOTERID", for: indexPath) as! TotalCostFooter
            
            self.viewModel?.footer = header
        
        return header
        } else {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HEADERID", for: indexPath) as! DishesCollectionViewHeader
            header.sectionNameLabel.text = ""
            return header
        }
    }
    
}

extension CartCollectionViewController: UpdateCartDelegate {
    /**
     Handles event when amount of dish in cart gets 0
    */
    func shouldRemoveItemAt(indexPath: IndexPath?) {
        if let path = indexPath {
            self.collectionView.deleteItems(at: [path])
        }
    }
}
