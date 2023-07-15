import Foundation

public extension UInt16 {
    func toDouble() -> Double {
        return Double(self)
    }
}

public extension UInt32 {
    func toDouble() -> Double {
        return Double(self)
    }
}

public extension UInt64 {
    func toInt() -> Int {
        return Int(self)
    }
    
    func toDouble() -> Double {
        return Double(self.toInt())
    }
}


public extension Int {
    static func getUniqueRandomNumbers(min: Int, max: Int, count: Int) -> [Int] {
        var set = Set<Int>()
        while set.count < count {
            set.insert(Int.random(in: min...max))
        }
        return Array(set)
    }
    
    static func generateRandomPhoneNumber() -> String {
        var number = ""
        let randomNumbers = getUniqueRandomNumbers(min: 0, max: 9, count: 10)
        
        for randomNumber in randomNumbers {
            number.append(String(randomNumber))
        }
        
        return number
    }

}
