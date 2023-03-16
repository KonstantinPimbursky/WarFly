//
//  Cloud.swift
//  WarFly
//
//  Created by Konstantin Pimbursky on 16.03.2023.
//

import SpriteKit
import GameplayKit

protocol GameBackgroundSpriteable {
    static func populate(at point: CGPoint) -> Self
}

final class Cloud: SKSpriteNode, GameBackgroundSpriteable {
    
    // MARK: - Private Properties
    
    private static var randomScaleFactor: CGFloat {
        let distribution = GKRandomDistribution(lowestValue: 20, highestValue: 30)
        let randomNumber = CGFloat(distribution.nextInt()) / 10
        return randomNumber
    }
    
    // MARK: - Public Methods
    
    static func populate(at point: CGPoint) -> Cloud {
        let cloudImageName = configureName()
        let cloud = Cloud(imageNamed: cloudImageName)
        cloud.setScale(randomScaleFactor)
        cloud.position = point
        cloud.zPosition = 10
        return cloud
    }
    
    // MARK: - Private Methods
    
    private static func configureName() -> String {
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 3)
        let randomNumber = distribution.nextInt()
        let imageName = "cl" + "\(randomNumber)"
        return imageName
    }
}
