import Foundation

public extension Data {
    func toString() -> String? {
        return String(data: self, encoding: .utf8)
    }
}

public extension Data {
    func toByteArray() -> [UInt8] {
        return [UInt8](self)
    }
}

public extension [UInt8] {
    func toData() -> Data {
        return Data(self)
    }
}
