import Foundation

fileprivate func getDateFormatter(_ pattern: String) -> DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = pattern
    return formatter
}

public enum DateFormats: String {
    case ISO8601 = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
    
    /// It returns formatted date string e.g. 11.04.2021 | 10:00:00
    case fullDateWithHour = "dd.MM.yyyy | HH:mm:ss"
}

public extension Date {
    var isExpired: Bool {
        let today = Date()
        return today > self
    }
    
    var utcTimestamp: Int {
        return Int(self.timeIntervalSince1970)
    }
    
    func getFormattedDate(format: DateFormats) -> String {
        return getDateFormatter(format.rawValue).string(from: self)
    }
}

public extension String {
    func getFormattedDate(format: DateFormats) -> Date? {
        return getDateFormatter(format.rawValue).date(from: self)
    }
}
