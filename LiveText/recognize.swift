import Foundation
import Vision

func recognize(image: CGImage) throws -> [VNRecognizedText] {
    return try observe(image: image).compactMap({ result in
        result.topCandidates(1).first
    })
}
