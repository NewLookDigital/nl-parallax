//
//  ContentView.swift
//  NLParallax
//

import SwiftUI
import SpriteKit
import NLParallaxEffect

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

struct ContentView: View {
    var body: some View {
        ZStack {
            SnowSceneryParallaxView()
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
