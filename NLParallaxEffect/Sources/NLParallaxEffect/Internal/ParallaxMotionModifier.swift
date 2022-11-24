import SwiftUI
import CoreMotion

/// See: https://trailingclosure.com/device-motion-effect/
struct ParallaxMotionModifier: ViewModifier {
    
    @ObservedObject var manager: MotionManager
    var magnitude: Double
    
    public init(manager: MotionManager, magnitude: Double) {
        self.manager = manager
        self.magnitude = magnitude
    }
    
    public func body(content: Content) -> some View {
        content
            .offset(x: CGFloat(manager.roll * magnitude), y: CGFloat(manager.pitch * magnitude))
    }
}
