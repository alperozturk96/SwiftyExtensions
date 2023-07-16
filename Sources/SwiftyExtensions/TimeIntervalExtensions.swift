import Foundation

public extension TimeInterval {
    
    /// It formats TimeInterval in minute and seconds e.g. 00:43
    func formatInMinSec() -> String {
        let formatter = DateComponentsFormatter()
        
        let secondsInHour: TimeInterval = 60 * 60
        let secondsInDay: TimeInterval = secondsInHour * 24
        if self >= secondsInDay {
            formatter.allowedUnits = [.day, .hour, .minute, .second]
        } else {
            formatter.allowedUnits = [.hour, .minute, .second]
        }
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad

        return formatter.string(from: self) ?? ""
    }
}
