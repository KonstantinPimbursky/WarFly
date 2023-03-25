//
//  GameBackgroundSpriteable+Extension.swift
//  WarFly
//
//  Created by Konstantin Pimbursky on 25.03.2023.
//

import SpriteKit
import GameKit

protocol GameBackgroundSpriteable {
    static func populate(at point: CGPoint?) -> Self
    static func randomPoint() -> CGPoint
}

extension GameBackgroundSpriteable {
    static func randomPoint() -> CGPoint {
        let screen = UIScreen.main.bounds
        let distribution = GKRandomDistribution(
            lowestValue: Int(screen.size.height) + 400,
            highestValue: Int(screen.size.height) + 500
        )
        let y = CGFloat(distribution.nextInt())
        let x = CGFloat(GKRandomSource.sharedRandom().nextInt(upperBound: Int(screen.size.width)))
        return CGPoint(x: x, y: y)
    }
}
