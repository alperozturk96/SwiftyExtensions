import Foundation

public extension [String] {
    func toString() -> String {
        return self.joined(separator: String.Space)
    }
}

// MARK: Date Related
public extension String {
    private var ISO8601DateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter
    }
    
    /// It formats to 10.06.2023 | 14.10
    var ISO8601Representation: String? {
        let dateFormatter = self.ISO8601DateFormatter
        guard let date = self.ISO8601Date else { return nil }
        dateFormatter.dateFormat = "dd.MM.yyyy | HH.mm"
        return dateFormatter.string(from: date)
    }
    
    /// It returns Date from ISO8601 string
    var ISO8601Date: Date? {
        let dateFormatter = self.ISO8601DateFormatter
        guard let date = dateFormatter.date(from: self) else {
            return nil
        }
        return date
    }
}

public extension String {
    func formatLocalized(key: String) -> String {
        return String(format: key.localized, self)
    }
    
    func toArray() -> [String] {
        return self.components(separatedBy: String.Space)
    }
}


public extension String {
    /// Example usage "sentence" = "Sentence @ @ @" -> "sentence".argLocalized(["hello", "world", "swift"]) output will be -> sentence hello world swift
    func argLocalized(_ args: [String], symbol: Character = "@") -> String {
        var result = self.localized
        
        for arg in args {
            if let index = result.firstIndex(of: symbol) {
                result = result.replacingCharacters(in: index...index, with: arg)
            }
        }
        
        return result
    }
}


public extension String {
    func trimmingLeadingAndTrailingSpaces(using characterSet: CharacterSet = .whitespacesAndNewlines) -> String {
        return trimmingCharacters(in: characterSet)
    }
}

public extension String {
    static var ThousandSeparator: String {
        "’"
    }
    
    static var Space: String {
        " "
    }
    
    static var Dot: String {
        "."
    }
    
    static var Plus: String {
        "+"
    }
    
    static var Minus: String {
        "-"
    }
    
    static var Equal: String {
        "="
    }
    
    static var LessThan: String {
        "<"
    }
    
    static var BiggerThan: String {
        ">"
    }
}

public extension String {
    subscript(idx: Int) -> String {
        if idx >= self.count {
            return ""
        } else {
            return String(self[index(startIndex, offsetBy: idx)])
        }
    }
    
    func toData() -> Data {
        return Data(self.utf8)
    }
    
    func toDouble() -> Double? {
        return Double(self)
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// Add "+" sign to beginning of source e.g. source: "14.01" output: "+14.01"
    func addPlusPrefix() -> String {
        return String.Plus.plus(self)
    }
    
    /// Add "-" sign to beginning of source e.g. source: "14.01" output: "-14.01"
    func addMinusPrefix() -> String {
        return String.Minus.plus(self)
    }
    
    /// Add " " to beginning of source e.g. source: "Aa" output: " Aa"
    func addSpacePrefix() -> String {
        return String.Space.plus(self)
    }
    
    /// Add input to end of source e.g. source: "Aa", input: "1" output will be "Aa1"
    func plus(_ input: String) -> String {
        return self + input
    }
    
    /// Return first n elements of String
    func take(_ n: Int) -> String {
        let subString = self.prefix(n)
        return String(subString)
    }
    
    func randomNumber(length: Int = 4) -> String {
        let letters = "123456789"
        return String((0..<length).map { _ in letters.randomElement()! })
    }
    
    /// Default character is '.'
    func before(first delimiter: Character = ".") -> String? {
        if let index = firstIndex(of: delimiter) {
            let before = prefix(upTo: index)
            return String(before)
        }
        return nil
    }
    
    /// Default character is '.'
    func after(first delimiter: Character = ".") -> String? {
        if let index = firstIndex(of: delimiter) {
            let after = suffix(from: index).dropFirst()
            return String(after)
        }
        return nil
    }

    func randomMailSuffix() -> String {
        let providers = ["test.com", "test2.com", "test3.com", "test4.com", "test5.com"]
        let randomIndex = Int.random(in: 0..<providers.count)
        return providers[randomIndex]
    }
}
