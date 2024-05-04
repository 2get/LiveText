import ArgumentParser
import UniformTypeIdentifiers
import Vision
import VisionKit

@main
struct LiveTexts: ParsableCommand {
    @Argument(help: "Input image file.", completion: .file(extensions: [".jpg", ".png"]))
    var imagePath: String
    
    mutating func run() throws {
        let imageURL = URL(fileURLWithPath: imagePath)
        guard let imageSource = CGImageSourceCreateWithURL(imageURL as CFURL, nil),
              let cgImage = CGImageSourceCreateImageAtIndex(imageSource, 0, nil ) else {
            throw CommandError("Failed to create CGImage form \(imagePath)")
        }
        
        for item in try extract(image: cgImage) {
            print(item.text)
        }
    }
}
