//
//  DaySelectionController.swift
//  LozhkaApp
//
//  Created by Ирина Улитина on 17/03/2019.
//  Copyright © 2019 Christian Benua. All rights reserved.
//

import Foundation
import UIKit

protocol OnDayChosenDelegate: class {
    func onDayChosen(day: Int)
}

class DaySelectionController: UIViewController {
    
    private let weekDays = ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"]
    
    private var buttons = [UIButton]()
    
    weak var delegate: OnDayChosenDelegate?
    
    private func addSubviews() {
        
        for key in weekDays {
            let but = UIButton(type: .system)
            but.setTitle(key, for: .normal)
            but.setTitleColor(UIColor.lightText, for: .normal)
            
            but.clipsToBounds = true
            but.layer.cornerRadius = 8
            but.backgroundColor = UIColor(red: 32.0 / 255, green: 32.0 / 255, blue: 32 / 255, alpha: 1.0)
            but.layer.borderWidth = 0.6
            but.layer.borderColor = UIColor.lightText.cgColor
            but.addTarget(self, action: #selector(dayButtonOnClick(_:)), for: .touchUpInside)
            
            self.buttons.append(but)
        }
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6).isActive = true
        stackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
        
    }
    
    @objc func dayButtonOnClick(_ sender: Any?) {
        let index = self.buttons.index(of: sender as! UIButton)!
        
        delegate?.onDayChosen(day: index)
    }
    
    /*let navBarView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.1)
        
        
        return view
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(UIColor.lightText, for: .normal)
        button.addTarget(self, action: #selector(backButtonOnClick), for: .touchUpInside)
        
        return button
    }()
    */
    
    
    @objc func backButtonOnClick() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.15, green: 0.05, blue: 0.02, alpha: 1.0)
        self.navigationItem.title = "Выбор дня"
        /*self.view.addSubview(navBarView)
        self.navBarView.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 85)
        self.navBarView.addSubview(backButton)
        backButton.anchor(top: nil, left: self.navBarView.leftAnchor, bottom: self.navBarView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 2, paddingRight: 0, width: 0, height: 0)*/
        
        addSubviews()
    }
}
