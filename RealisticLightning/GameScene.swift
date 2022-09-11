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
        configure()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        Lightning.lightningStrike(
            throughPath: Lightning.generateLightningPath(
                startingFrom: CGPoint(x: frame.midX, y: frame.size.height/2)
            ),
            delegateView: self
        )
    }

    func configure() {
        self.backgroundColor = .black
    }

}

