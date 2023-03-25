//
//  Cloud.swift
//  WarFly
//
//  Created by Konstantin Pimbursky on 16.03.2023.
//

import SpriteKit
import GameplayKit

final class Cloud: SKSpriteNode, GameBackgroundSpriteable {
    
    // MARK: - Private Properties
    
    private static var randomScaleFactor: CGFloat {
        let distribution = GKRandomDistribution(lowestValue: 20, highestValue: 30)
        let randomNumber = CGFloat(distribution.nextInt()) / 10
        return randomNumber
    }
    
    // MARK: - Public Methods
    
    static func populate() -> Cloud {
        let cloudImageName = configureName()
        let cloud = Cloud(imageNamed: cloudImageName)
        cloud.setScale(randomScaleFactor)
        cloud.position = randomPoint()
        cloud.zPosition = 10
        cloud.run(move(from: cloud.position))
        return cloud
    }
    
    // MARK: - Private Methods
    
    private static func configureName() -> String {
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 3)
        let randomNumber = distribution.nextInt()
        let imageName = "cl" + "\(randomNumber)"
        return imageName
    }
    
    private static func move(from point: CGPoint) -> SKAction {
        let movePoint = CGPoint(x: point.x, y: -200)
        let moveDistance = point.y + 200
        let movementSpeed: CGFloat = 150
        let duration = moveDistance / movementSpeed
        return SKAction.move(to: movePoint, duration: TimeInterval(duration))
    }
}
