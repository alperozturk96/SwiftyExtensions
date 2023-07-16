import Foundation
import UIKit.UIImage

public extension String {
    func generateQRCode() -> UIImage? {
        print("QRCode content is " + self)
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
        let data = self.data(using: .isoLatin1, allowLossyConversion: false)
        filter.setValue(data, forKey: "inputMessage")
        filter.setValue("H", forKey: "inputCorrectionLevel")
        guard let ciimage = filter.outputImage else { return nil }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledCIImage = ciimage.transformed(by: transform)
        let uiimage = UIImage(ciImage: scaledCIImage)
        guard let pngData = uiimage.pngData() else { return nil }
        return UIImage(data: pngData)
    }
}
