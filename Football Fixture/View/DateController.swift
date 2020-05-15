//
//  DateController.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi Hammed on 15/05/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation


class DateController{
    var formatter = ISO8601DateFormatter()
    
    //FROM DATE
    var fromDate:String{
        formatter.formatOptions = [.withFullDate]
        return formatter.string(from: Date())
    }
    
    //TO Date seven days from current date
    var toDate:String{
        formatter.formatOptions = [.withFullDate]
        let calendar = Calendar(identifier: .iso8601)
        let dateComponent = DateComponents(day: 7)
        let nextWeek = calendar.date(byAdding: dateComponent, to: Date())
        return formatter.string(from: nextWeek!)
    }
}

public func dateToDay(_ date:Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM d"
    return dateFormatter.string(from: date)
}

public func dateToTime(_ date:Date) -> String {
    let timeFormatter = DateFormatter()
    timeFormatter.dateFormat =  "HH:mm"
    return timeFormatter.string(from: date)
}
