import Foundation

public extension Double {
    /// Input: 12.213123 output will be 12.21
    func twoDecimalAsDouble() -> Double? {
        return self.twoDecimal().toDouble()
    }
    
    func twoDecimal() -> String {
        return String(format: "%.2f", self)
    }
}

