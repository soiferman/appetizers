//
//  Date+Ext.swift
//  Appetizers
//
//  Created by Max Soiferman on 14/10/23.
//

import Foundation

extension Date {
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: .now)!
    }
    
    var oneHundredTwentyYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -120, to: .now)!
    }
}
