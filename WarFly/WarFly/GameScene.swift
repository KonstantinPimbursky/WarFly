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
    }
}
