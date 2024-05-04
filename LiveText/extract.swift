import Foundation
import Vision

func extract(image: CGImage) throws -> [Item] {
    return try recognize(image: image).compactMap { result in
        let text = result.string
        let range = text.startIndex..<text.endIndex
        let rect = try result.boundingBox(for: range).map { rect in
            let rect = VNImageRectForNormalizedRect(rect.boundingBox, image.width, image.height)
            let y = Double(image.height) - rect.maxY
            return Rect(x: rect.minX, y: y, width: rect.width, height: rect.height)
        }
        
        return Item(text: text, rect: rect)
    }
}
