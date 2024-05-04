import Vision

func observe(image: CGImage) throws -> [VNRecognizedTextObservation] {
    let handler = VNImageRequestHandler(cgImage: image)
    
    let request = VNRecognizeTextRequest()
    //request.minimumTextHeight = 0.1
    // 最高品質
    request.recognitionLevel = .accurate
    // 日本語
    request.recognitionLanguages = ["ja"]
    // 言語補正フラグ
    request.usesLanguageCorrection = true
    
    try handler.perform([request])
    
    guard let results = request.results else {
        throw CommandError("VNRecognizedTextObservation.results is nil.")
    }
    
    return results
}
