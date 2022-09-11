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
            endPoint.x += CGFloat.random(in: -Constants.accuracy ... Constants.accuracy)
        }

        return strikePath
    }

    static func lightningStrike(throughPath: [SKShapeNode], delegateView: SKScene, maxFlickeringTimes: Int = 3) {

        let fadeTime = TimeInterval(CGFloat.random(in: Constants.minTime ... Constants.maxTime))
        let waitAction = SKAction.wait(forDuration: Constants.waitingDuration)
        let reduceAlphaAction = SKAction.fadeAlpha(to: Constants.fadingEndZero, duration: fadeTime)
        let increaseAlphaAction = SKAction.fadeAlpha(to: Constants.fadingEndOne, duration: fadeTime)
        let flickerSeq = [waitAction, reduceAlphaAction, increaseAlphaAction]

        var seq: [SKAction] = []
        let numberOfFlashes = Int.random(in: 1 ... maxFlickeringTimes)

        for _ in 1 ... numberOfFlashes {
            seq.append(contentsOf: flickerSeq)
        }


        for line in throughPath {
            seq.append(SKAction.fadeAlpha(
                to: Constants.fadingEndZero,
                duration: Constants.waitingDuration * Double(Constants.amountOfStrikes)
            ))
            seq.append(SKAction.removeFromParent())
            line.run(SKAction.sequence(seq))
            delegateView.addChild(line)
        }

        flashTheScreen(nTimes: 2, delegateView: delegateView)
    }

    private static func flashTheScreen(nTimes: Int, delegateView: SKScene) {
        let lightUpScreenAction = SKAction.run {
            delegateView.backgroundColor = UIColor.gray
        }
        let waitAction = SKAction.wait(forDuration: Constants.waitingDuration)
        let dimScreenAction = SKAction.run {
            delegateView.backgroundColor = .black
        }
        var flashActionSeq: [SKAction] = []
        for _ in 1 ... nTimes + 1 {
            flashActionSeq.append(
                contentsOf: [
                lightUpScreenAction,
                waitAction,
                dimScreenAction,
                waitAction
            ])
        }
        delegateView.run(SKAction.sequence(flashActionSeq))
    }
}


enum Constants {
    static let amountOfLines = 120
    static let accuracy = CGFloat(10)
    static let fadingEndZero = CGFloat(0)
    static let fadingEndOne = CGFloat(1)
    static let fadingTimeDuration = CGFloat(1)
    static let minTime = 0.005
    static let maxTime = 0.03
    static let waitingDuration = 0.05
    static let amountOfStrikes = 5

}
