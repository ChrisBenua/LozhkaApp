//
//  ViewController.swift
//  LozhkaApp
//
//  Created by Ирина Улитина on 16/03/2019.
//  Copyright © 2019 Christian Benua. All rights reserved.
//

import UIKit



class MainCollectionViewController: UICollectionViewController {

    private var viewModel: MainCollectionViewModel
    
    init() {
        viewModel = MainCollectionViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //self.collectionView.addGestureRecognizer(UIPanGestureRecognizer(target: self.viewModel, action: #selector(self.viewModel.handlePanGesture(_:))))
        
        self.collectionView.register(UINib(nibName: "DishCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CELLID")
        self.collectionView.register(DishesCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerId")
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.reloadData()
    }

    required init?(coder aDecoder: NSCoder) {
        viewModel = MainCollectionViewModel()

        super.init(coder: aDecoder)
        //viewModel.view = self.collectionView
    }
    

    
}


//MARK:- DataSource
extension MainCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.currentGroupDishes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.currentGroupDishes[section].count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "CELLID", for: indexPath) as! DishCollectionViewCell
        cell.configure(dish: viewModel.currentGroupDishes[indexPath.section][indexPath.row])
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerId", for: indexPath) as! DishesCollectionViewHeader
        header.sectionNameLabel.text = viewModel.sectionNames[indexPath.section]
        
        return header
    }
}

//MARK:- CollectionViewFlowDelegate
extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let text = viewModel.currentGroupDishes[indexPath.section][indexPath.row].name
        let grams = viewModel.currentGroupDishes[indexPath.section][indexPath.row].grams.compactMap { (el) -> String in
            "\(el)"
        }.joined(separator: "/") + " Гр"
        
        let gramsWidth = grams.widthWithConstrainedHeight(height: 40, font: UIFont.systemFont(ofSize: 17))
        
        return CGSize(width: self.view.frame.width - 20, height: text.heightWithConstrainedWidth(width: (self.view.frame.width - 20 - gramsWidth - 30), font: UIFont.systemFont(ofSize: 19)) + 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width - 20, height: 40)
    }
    
    
}


