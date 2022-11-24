import Foundation
import SpriteKit

extension SKEmitterNode {
    static func fromBundle(fileName: String, bundle: Bundle?) -> SKEmitterNode? {
        guard let bundle = bundle else { return nil }
        guard let path = bundle.path(forResource: fileName, ofType: "sks") else { return nil }
        if let data = FileManager.default.contents(atPath: path) {
            return try? NSKeyedUnarchiver.unarchivedObject(ofClass: SKEmitterNode.self, from: data)
        }
        return nil
    }
}
