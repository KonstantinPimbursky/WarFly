//
//  GameScene.swift
//  WarFly
//
//  Created by Konstantin Pimbursky on 16.03.2023.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        let screenCenterPoint = CGPoint(x: size.width / 2, y: size.height / 2)
        let background = Background.populateBackground(at: screenCenterPoint)
        background.size = size
        addChild(background)
        
        let screen = UIScreen.main.bounds
        for _ in 1...5 {
            let x: CGFloat = CGFloat(GKRandomSource.sharedRandom().nextInt(upperBound: Int(screen.size.width)))
            let y: CGFloat = CGFloat(GKRandomSource.sharedRandom().nextInt(upperBound: Int(screen.size.height)))
            
            let island = Island.populate(at: CGPoint(x: x, y: y))
            addChild(island)
            
            let cloud = Cloud.populate(at: CGPoint(x: x, y: y))
            addChild(cloud)
        }
    }
}
