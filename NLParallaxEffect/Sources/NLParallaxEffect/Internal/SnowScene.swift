import Foundation
import SpriteKit

class SnowScene: SKScene {

    let snowEmitterNode: SKEmitterNode? = {
        var node = SKEmitterNode.fromBundle(fileName: "snow", bundle: .module)
        if let uiImage = UIImage(named: "spark", in: .module, with: nil) {
            node?.particleTexture = SKTexture(image: uiImage)
        }
        return node
    }()

    override func didMove(to view: SKView) {
        guard let snowEmitterNode = snowEmitterNode else { return }
        snowEmitterNode.particleSize = CGSize(width: 50, height: 50)
        snowEmitterNode.particleLifetime = 2
        snowEmitterNode.particleLifetimeRange = 6
        addChild(snowEmitterNode)
    }

    override func didChangeSize(_ oldSize: CGSize) {
        guard let snowEmitterNode = snowEmitterNode else { return }
        snowEmitterNode.particlePosition = CGPoint(x: size.width/2, y: size.height)
        snowEmitterNode.particlePositionRange = CGVector(dx: size.width, dy: size.height)
    }
}
