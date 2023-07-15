import Foundation

public extension Error {
    
    /// Returns actual error representation. Use when localizedDescription don't return detailed results.
    func describing() -> String {
        return String(describing: self)
    }
}

