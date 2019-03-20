//
//  DateExtension.swift
//  LozhkaApp
//
//  Created by Ирина Улитина on 16/03/2019.
//  Copyright © 2019 Christian Benua. All rights reserved.
//

import Foundation

extension Date {
    /**
     Gets current day of week from 0 to 6, 0-Sunday, 6-Saturday
     */
    func dayNumberOfWeek() -> Int {
        return Calendar.current.dateComponents([.weekday], from: self).weekday!
    }
}
