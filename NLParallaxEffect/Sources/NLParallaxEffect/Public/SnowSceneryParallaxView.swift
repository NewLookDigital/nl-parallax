//
//  ParallaxView.swift
//  NLParallax
//
//  Created by Marcin Maciukiewicz on 24/11/2022.
//

import Foundation
import SwiftUI
import SpriteKit

public struct SnowSceneryParallaxView: View {
    @ObservedObject var manager = MotionManager()
    
    let shadowColour = Color(hue: 0.4, saturation: 0.1, brightness: 0.24)
    let shadowRadius = 3.0
    let shadowOffset = -3.0
    
    var snowScene: SKScene {
        let scene = SnowScene()
        scene.scaleMode = .resizeFill
        scene.backgroundColor = .clear
        return scene
    }
    
    public init() {}

    public var body: some View {
        ZStack {
            Image("background", bundle: .module)
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .modifier(ParallaxMotionModifier(manager: manager, magnitude: 5))
            Image("back #1", bundle: .module)
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .shadow(color: shadowColour, radius: shadowRadius, x: 0, y: shadowOffset)
                .modifier(ParallaxMotionModifier(manager: manager, magnitude: 8))
            Image("back #2", bundle: .module)
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .shadow(color: shadowColour, radius: shadowRadius, x: 0, y: shadowOffset)
                .modifier(ParallaxMotionModifier(manager: manager, magnitude: 11))
            Image("back #3", bundle: .module)
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .shadow(color: shadowColour, radius: shadowRadius, x: 0, y: shadowOffset)
                .modifier(ParallaxMotionModifier(manager: manager, magnitude: 14))
            SpriteView(scene: snowScene, options: [.allowsTransparency])
                            .ignoresSafeArea()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .modifier(ParallaxMotionModifier(manager: manager, magnitude: 17))
            Image("back #4", bundle: .module)
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .scaledToFit()
                .shadow(color: shadowColour, radius: shadowRadius, x: 0, y: shadowOffset)
                .modifier(ParallaxMotionModifier(manager: manager, magnitude: 20))
            Image("back #5", bundle: .module)
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .shadow(color: shadowColour, radius: shadowRadius, x: 0, y: shadowOffset)
                .modifier(ParallaxMotionModifier(manager: manager, magnitude: 23))
        }
        .aspectRatio(1.0, contentMode: ContentMode.fit)
    }
}
