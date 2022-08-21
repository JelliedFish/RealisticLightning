//
//  Shape.swift
//  RealisticLightning
//
//  Created by JelliedFish on 21.08.2022.
//

import Foundation
import GameplayKit


protocol Shape {
    
   static func getShape(points: [CGPoint]) -> SKShapeNode
}
