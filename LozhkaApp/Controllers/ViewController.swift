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
        
        self.collectionView.register(UINib(nibName: "DishCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CELLID")
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.reloadData()
    }

    required init?(coder aDecoder: NSCoder) {
        viewModel = MainCollectionViewModel()

        super.init(coder: aDecoder)
    }
}


//MARK:- DataSource
extension MainCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.groupedDishes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.groupedDishes[section].count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "CELLID", for: indexPath) as! DishCollectionViewCell
        cell.configure(dish: viewModel.groupedDishes[indexPath.section][indexPath.row])
        
        
        return cell
    }
}

//MARK:- CollectionViewFlowDelegate
extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - 20, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

