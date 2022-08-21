//
//  Line.swift
//  RealisticLightning
//
//  Created by JelliedFish on 21.08.2022.
//

import Foundation
import GameplayKit


class LineShape: Shape {
    
    static func getShape(points: [CGPoint]) -> SKShapeNode {
        let pathToDraw = CGMutablePath()
            pathToDraw.move(to: points[0])
            pathToDraw.addLine(to: points[1])
            let line = SKShapeNode()
            line.path = pathToDraw
            line.glowWidth = 1
            line.strokeColor = .white
            return line
    }

}
