import UIKit

// TODO Self will be generic for Double, Int, CGFloat, Float
public extension Numeric where Self == CGFloat {
    /// It returns scaled value according to device scale factor.
    func scale() -> Self {
        /// Minimum scale factor is 2 because minimum supported devices are iPhone 6s and iPhone SE (1st Gen)
        let minScaleFactor: Self = 2
        
        /// Target device's scale factor.
        let deviceScaleFactor: CGFloat = UIScreen.main.scale
        
        return (deviceScaleFactor > minScaleFactor) ? (deviceScaleFactor * self / minScaleFactor) : self
    }
}

public extension Numeric where Self == Float {
    /// Format any argument with desired decimal. Default is 2.
    func format(decimal: Self = 2) -> String {
        return String(format: "%.\(decimal)f", self)
    }
}
