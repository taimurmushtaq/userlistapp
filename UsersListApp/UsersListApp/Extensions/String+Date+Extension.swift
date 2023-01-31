//
//  String+Extension.swift
//  ToDoList
//
//  Created by Taimur Mushtaq on 25/01/2023.
//

import Foundation

enum DateFormats: String {
    case simpleFormat = "MMMM dd, YYYY"
    case dob = "dd MMM YYYY"
    case todayFormat = "'Today,' hh:mm a"
    case yesterdayFormat = "'Yesterday,' hh:mm a"
    case registerationFormat = "YYYY-MM-dd'T'HH:mm:ss.SSSZ"
}

extension String {
    func convertToDate(withFormat format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        
        return dateFormatter.date(from: self)
    }
}

extension Date {
    func isToday() -> Bool {
        return Calendar.current.isDateInToday(self)
    }
    func isYesterday() -> Bool {
        return Calendar.current.isDateInYesterday(self)
    }
    func isInWeak() -> Bool {
        return daysBetweenDate(toDate: Date()) < 7
    }
    func relativeString() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
    
    func daysBetweenDate(toDate: Date) -> Int {
        let components = Calendar.current.dateComponents([.day], from: self, to: toDate)
        return components.day ?? 0
    }
    
    func convertToString(withFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        
        return dateFormatter.string(from: self)
    }
}
