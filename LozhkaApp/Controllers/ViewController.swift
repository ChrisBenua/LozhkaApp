//
//  ViewController.swift
//  LozhkaApp
//
//  Created by Ирина Улитина on 16/03/2019.
//  Copyright © 2019 Christian Benua. All rights reserved.
//

import UIKit



class MainCollectionViewController: UICollectionViewController {

    /**
     View's viewModel
    */
    private var viewModel: MainCollectionViewModel
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    /**
     Initializes empty View
    */
    init() {
        viewModel = MainCollectionViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData()
        
        self.navigationItem.title = "Меню на " + self.viewModel.intToDayOfWeek[self.viewModel.day]!
    }
    
    /**
     AutoLayout
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "shopping-cart").withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(cartButtonOnClick(_:)))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "settings"), style: .plain, target: self, action: #selector(settingsButtonOnClick(_:)))
        
        
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        
        self.collectionView.backgroundColor = UIColor(red: 0.15, green: 0.05, blue: 0.02, alpha: 1.0)
       // self.collectionView.addGestureRecognizer(UIPanGestureRecognizer(target: self.viewModel, action: #selector(self.viewModel.handlePanGesture(_:))))
        self.navigationController?.navigationBar.barStyle = .blackTranslucent
        
        //self.collectionView.backgroundView = UIImageView(image: UIImage(named: "wallpaper"))
        self.collectionView.register(UINib(nibName: "DishCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CELLID")
        self.collectionView.register(DishesCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerId")
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    required init?(coder aDecoder: NSCoder) {
        viewModel = MainCollectionViewModel()

        super.init(coder: aDecoder)
        //viewModel.view = self.collectionView
    }
    
    /**
     Handles tap on cart icon
    */
    @objc func cartButtonOnClick(_ sender: Any?) {
        let vc = CartCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        vc.viewModel = CartControllerViewModel(viewModel: self.viewModel)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    /**
     Handles tap on settings
    */
    @objc func settingsButtonOnClick(_ sender: Any?) {
        let vc = DaySelectionController(chosenDay: self.viewModel.day)
        vc.delegate = self.viewModel
        self.navigationController?.pushViewController(vc, animated: true)
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
        cell.delegate = self.viewModel
        
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
        
        
        //let gramsWidth = grams.widthWithConstrainedHeight(height: 40, font: UIFont.systemFont(ofSize: 17))
        
        return CGSize(width: self.view.frame.width - 10, height: text.heightWithConstrainedWidth(width: (self.view.frame.width - 20 - 36), font: UIFont.systemFont(ofSize: 19)) + 102)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width - 20, height: 40)
    }
    
    
    
}


