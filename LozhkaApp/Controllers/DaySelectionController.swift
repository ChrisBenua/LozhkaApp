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
    /**
     Default text attributes for button
    */
    private let defaultAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]
    
    /**
     Selected text attributes for button
     */
    private let selectedAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: UIColor.white]
    
    /**
    Chosen button's color
     */
    private let chosenButtonColor = UIColor(red: 0.19, green: 0.31, blue: 1.00, alpha: 1.0)
    
    /**
     Default button's color
     */
    private let defaultButtonColor = UIColor(red: 32.0 / 255, green: 32.0 / 255, blue: 32 / 255, alpha: 1.0)
    
    /**
     Week Days
    */
    private let weekDays = ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"]
    
    /**
     Buttons array
    */
    private var buttons = [UIButton]()
    
    /**
     delegate for handling events when chosen day changes
    */
    weak var delegate: OnDayChosenDelegate?
    
    /**
     Current Chosen day
    */
    var currentChosenDay: Int = 0
    
    /**
     Highlites chosen buttons
     */
    private func chooseButton(clickedButton: UIButton) {
        for button in buttons {
            button.backgroundColor = defaultButtonColor
            let attr = button.attributedTitle(for: .normal)!
            let newAttr = NSAttributedString(string: attr.string, attributes: defaultAttributes)
            button.setAttributedTitle(newAttr, for: .normal)
        }
        clickedButton.backgroundColor = chosenButtonColor
        clickedButton.setAttributedTitle(NSAttributedString(string: clickedButton.attributedTitle(for: .normal)!.string, attributes: selectedAttributes), for: .normal)
    }
    
    /**
     Adds button on screen
    */
    private func addSubviews() {
        
        for key in weekDays {
            let but = UIButton(type: .system)
            //but.setTitle(key, for: .normal)
            but.setAttributedTitle(NSAttributedString(string: key, attributes: defaultAttributes), for: .normal)
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
        chooseButton(clickedButton: buttons[currentChosenDay])
    }
    
    /**
     Handles tap on button
    */
    @objc func dayButtonOnClick(_ sender: Any?) {
        let clickedButton = sender as! UIButton
        chooseButton(clickedButton: clickedButton)
        let index = buttons.index(of: clickedButton)!
        delegate?.onDayChosen(day: index)
    }
    
    @objc func backButtonOnClick() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.15, green: 0.05, blue: 0.02, alpha: 1.0)
        self.navigationItem.title = "Выбор дня"
        addSubviews()
    }
    /**
     Initializes controller with current chosen day
    */
    init(chosenDay: Int) {
        self.currentChosenDay = chosenDay
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
