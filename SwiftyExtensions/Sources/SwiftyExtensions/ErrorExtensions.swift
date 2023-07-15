import Foundation

public extension Error {
    func describing() -> String {
        return String(describing: self)
    }
}

