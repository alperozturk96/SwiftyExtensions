import Foundation

private let encoder: JSONEncoder = JSONEncoder()
private let decoder: JSONDecoder = JSONDecoder()

public extension UserDefaults {
    
    func save<T: Codable>(key: String, value: T) throws {
        guard let data = try? encoder.encode(value) else {
            return
        }
        
        self.set(data, forKey: key)
    }
    
    func load<T: Codable>(key: String, value: T.Type) throws -> T? {
        guard let data = self.data(forKey: key) else {
            return nil
        }
        
        return try decoder.decode(value.self, from: data)
    }
}
