import Foundation

public extension Float {
    /// Input: 12.213123 output will be 12.21
    func twoDecimalAsDouble() -> Double? {
        return Double(self).twoDecimalAsDouble()
    }
}
