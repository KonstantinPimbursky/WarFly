//
//  Island.swift
//  WarFly
//
//  Created by Konstantin Pimbursky on 16.03.2023.
//

import SpriteKit
import GameplayKit

final class Island: SKSpriteNode, GameBackgroundSpriteable {
    
    // MARK: - Private Properties
    
    private static var randomScaleFactor: CGFloat {
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 10)
        let randomNumber = CGFloat(distribution.nextInt()) / 10
        return randomNumber
    }
    
    // MARK: - Public Methods
    
    static func populate(at point: CGPoint) -> Island {
        let islandImageName = configureName()
        let island = Island(imageNamed: islandImageName)
        island.setScale(randomScaleFactor)
        island.position = point
        island.zPosition = 1
        island.run(rotateForRandomAngle())
        island.run(move(from: point))
        return island
    }
    
    // MARK: - Private Methods
    
    private static func configureName() -> String {
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 4)
        let randomNumber = distribution.nextInt()
        let imageName = "is" + "\(randomNumber)"
        return imageName
    }
    
    private static func rotateForRandomAngle() -> SKAction {
        let distribution = GKRandomDistribution(lowestValue: 0, highestValue: 360)
        let randomNumber = CGFloat(distribution.nextInt())
        return SKAction.rotate(toAngle: randomNumber * CGFloat(Double.pi / 100), duration: 0)
    }
    
    private static func move(from point: CGPoint) -> SKAction {
        let movePoint = CGPoint(x: point.x, y: -200)
        let moveDistance = point.y + 200
        let movementSpeed: CGFloat = 10.0
        let duration = moveDistance / movementSpeed
        return SKAction.move(to: movePoint, duration: TimeInterval(duration))
    }
}
