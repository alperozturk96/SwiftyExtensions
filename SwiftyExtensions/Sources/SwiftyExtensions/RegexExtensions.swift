import Foundation

public extension String {
    func isEmailAddress() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return self.predict(emailRegex)
    }
    
    func isPhoneNumber() -> Bool {
        let number = self.removeSpaces().removeParentheses()
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        return number.predict(phoneRegex)
    }
    
    func replacingRegex(matching pattern: String, findingOptions: NSRegularExpression.Options = .caseInsensitive, replacingOptions: NSRegularExpression.MatchingOptions = [], with template: String) throws -> String {
        let regex = try NSRegularExpression(pattern: pattern, options: findingOptions)
        let range = NSRange(startIndex..., in: self)
        return regex.stringByReplacingMatches(in: self, options: replacingOptions, range: range, withTemplate: template)
    }
    
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    private func predict(_ regex: String) -> Bool {
        let predict = NSPredicate(format: "SELF MATCHES %@", regex)
        return predict.evaluate(with: self)
    }
}

// MARK: - ReplacingOccurrences
public extension String {
    func random(length: Int = 10) -> String {
        return String(UUID.init().uuidString.replacingOccurrences(of: "-", with: "").prefix(length)).lowercased()
    }
    
    func removeParentheses() -> String {
        return self.replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "")
    }
    
    func removeSpaces() -> String {
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    func removeCharacter(characterToBeRemoved: String = ".") -> String {
        return self.replacingOccurrences( of: characterToBeRemoved, with: "", options: .regularExpression)
    }
    
    func applyPatternOnNumbers(pattern: String = "(###) ### ## ## ## ## ##", replacmentCharacter: Character = "#", maxCount: Int = 15) -> String {
        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        
        if pureNumber.count > maxCount {
            return pureNumber.prefix(maxCount).lowercased()
        }
        
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = String.Index(utf16Offset: index, in: self)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacmentCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        
        return pureNumber
    }
    
    /// Returns a condensed string, with no extra whitespaces and no new lines.
    func condensed() -> String {
        return replacingOccurrences(of: "[\\s\n]+", with: " ", options: .regularExpression, range: nil)
    }
}
