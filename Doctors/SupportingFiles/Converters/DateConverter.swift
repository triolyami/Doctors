//
//  DateConverter.swift
//  Doctors
//
//  Created by Sergey on 23.06.2022.
//

import Foundation

final class DateConverter {
    static func showAppointmentDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en")
        formatter.dateFormat = "EEEE, MMM d"
        return formatter.string(from: date)
    }
    
    static func showDateForNavBar() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en")
        formatter.dateFormat = "MMM d, yyyy"
        let date = Date()
        return formatter.string(from: date)
    }

}
