//
//  GameScene.swift
//  RealisticLightning
//
//  Created by JelliedFish on 21.08.2022.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        self.backgroundColor = .black
        
        let line = LineShape.getShape(points: [CGPoint(x: 0, y: 0), CGPoint(x: 50, y: 50)])
        self.addChild(line)
    }
}
