import Foundation

public extension Collection {
    var isNotEmpty: Bool { !isEmpty }
    
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

public extension Array {
    mutating func appendDistinct<S>(contentsOf newElements: S, where condition:@escaping (Element, Element) -> Bool) where S: Sequence, Element == S.Element {
      newElements.forEach { (item) in
        if !(self.contains(where: { (selfItem) -> Bool in
            return !condition(selfItem, item)
        })) {
            self.append(item)
        }
    }
  }
}
