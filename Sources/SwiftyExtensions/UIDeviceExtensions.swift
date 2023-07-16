import UIKit

public extension UIDevice {
    /// Returns `true` if the device has a notch
    var hasNotch: Bool {
        guard let window = UIApplication.shared.firstWindow else { return false }
        
        if UIDevice.current.orientation.isPortrait {
            return window.safeAreaInsets.top >= 44
        } else {
            return window.safeAreaInsets.left > 0 || window.safeAreaInsets.right > 0
        }
    }
}
