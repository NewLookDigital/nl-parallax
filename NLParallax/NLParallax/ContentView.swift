//
//  ContentView.swift
//  NLParallax
//
//  Created by Marcin Maciukiewicz on 22/11/2022.
//

import SwiftUI
import SpriteKit

extension Path {
    var reversed: Path {
        let reversedCGPath = UIBezierPath(cgPath: cgPath)
            .reversing()
            .cgPath
        return Path(reversedCGPath)
    }
}

struct ShapeWithHole: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Rectangle().path(in: rect)
        let hole = Circle().path(in: rect).reversed
        path.addPath(hole)
        return path
    }
}

struct ParallaxView: View {
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

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .modifier(ParallaxMotionModifier(manager: manager, magnitude: 5))
            Image("back #1")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .shadow(color: shadowColour, radius: shadowRadius, x: 0, y: shadowOffset)
                .modifier(ParallaxMotionModifier(manager: manager, magnitude: 8))
            Image("back #2")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .shadow(color: shadowColour, radius: shadowRadius, x: 0, y: shadowOffset)
                .modifier(ParallaxMotionModifier(manager: manager, magnitude: 11))
            Image("back #3")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .shadow(color: shadowColour, radius: shadowRadius, x: 0, y: shadowOffset)
                .modifier(ParallaxMotionModifier(manager: manager, magnitude: 14))
            SpriteView(scene: snowScene, options: [.allowsTransparency])
                            .ignoresSafeArea()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .modifier(ParallaxMotionModifier(manager: manager, magnitude: 17))
            Image("back #4")
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .scaledToFit()
                .shadow(color: shadowColour, radius: shadowRadius, x: 0, y: shadowOffset)
                .modifier(ParallaxMotionModifier(manager: manager, magnitude: 20))
            Image("back #5")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .shadow(color: shadowColour, radius: shadowRadius, x: 0, y: shadowOffset)
                .modifier(ParallaxMotionModifier(manager: manager, magnitude: 23))
        }
        .aspectRatio(1.0, contentMode: ContentMode.fit)
    }
}
struct ContentView: View {
    var body: some View {
        ZStack {
            ParallaxView()
            // Mask
            ZStack {
                  Rectangle()
                    .fill(Color.white)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                  Circle()    // source
                    .scale(x:0.8, y:0.8)
                    .blendMode(.destinationOut)
                }
                .compositingGroup()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
