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
    
    static var randomScaleFactor: CGFloat {
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
        return island
    }
    
    // MARK: - Private Methods
    
    static func configureName() -> String {
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 4)
        let randomNumber = distribution.nextInt()
        let imageName = "is" + "\(randomNumber)"
        return imageName
    }
    
    static func rotateForRandomAngle() -> SKAction {
        let distribution = GKRandomDistribution(lowestValue: 0, highestValue: 360)
        let randomNumber = CGFloat(distribution.nextInt())
        return SKAction.rotate(toAngle: randomNumber * CGFloat(Double.pi / 100), duration: 0)
    }
}
