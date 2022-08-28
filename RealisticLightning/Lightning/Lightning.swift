//
//  Lightning.swift
//  RealisticLightning
//
//  Created by JelliedFish on 28.08.2022.
//

import Foundation
import SpriteKit

class Lightning {
    
    static func generateLightningPath(startingFrom: CGPoint) -> [SKShapeNode] {
        
        var strikePath: [SKShapeNode] = []
        var startPoint = startingFrom
        var endPoint = startPoint

        for _ in 0..<Constants.amountOfLines {
            strikePath.append(LineShape.getShape(points: [startPoint,endPoint]))
            startPoint = endPoint
            endPoint.y -= Constants.accuracy
        }

        return strikePath
    }

    static func lightningStrike(throughPath: [SKShapeNode], delegateView: SKScene) {
        for line in throughPath {
            delegateView.addChild(line)
        }
    }
}


enum Constants {
    static let amountOfLines = 120
    static let accuracy = CGFloat(10)
}
