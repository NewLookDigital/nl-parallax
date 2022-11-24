import Foundation
import CoreMotion

/// See: https://trailingclosure.com/device-motion-effect/
class MotionManager: ObservableObject {

    @Published var pitch: Double = 0.0
    @Published var roll: Double = 0.0
    
    private var manager: CMMotionManager

    public init() {
        self.manager = CMMotionManager()
        self.manager.deviceMotionUpdateInterval = 1/60
        self.manager.showsDeviceMovementDisplay = true
        self.manager.startDeviceMotionUpdates(to: .main) { (motionData, error) in
            guard error == nil else {
                print(error!)
                return
            }

            if let motionData = motionData {
                self.pitch = motionData.attitude.pitch - 1.5708
                self.roll = motionData.attitude.roll
            }
        }

    }
}
