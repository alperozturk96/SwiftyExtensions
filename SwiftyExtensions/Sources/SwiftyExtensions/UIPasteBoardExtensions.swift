import UIKit.UIPasteboard

public extension UIPasteboard {
    static func pasteToClipboard(_ content: String) {
        self.general.string = content
    }
    
    static func readFromClipboard() -> String? {
        return self.general.string
    }
}
