import Foundation

public extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "\(self)_doesntExists")
    }
    
    func argLocalized(_ placeholder: String) -> String {
       return String(format: placeholder.localized, self)
    }
   
    func localized(_ args: [CVarArg]) -> String { return String(format: localized, args) }
    func localized(_ args: CVarArg...) -> String { return String(format: localized, args) }
}

public extension LocalizedError where Self: CustomStringConvertible {
    
    var errorDescription: String? {
        return description
    }
}

