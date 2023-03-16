//
//  GameScene.swift
//  WarFly
//
//  Created by Konstantin Pimbursky on 16.03.2023.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {
    
    let motionManager = CMMotionManager()
    var xAcceleration: CGFloat = 0
    var player: SKSpriteNode!
    
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
        
        player = PlayerPlane.populate(at: CGPoint(x: screen.size.width / 2, y: 100))
        addChild(player)
        
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { data, error in
            if let data = data {
                let acceleration = data.acceleration
                self.xAcceleration = CGFloat(acceleration.x) * 0.7 + self.xAcceleration * 0.3
            }
        }
    }
    
    override func didSimulatePhysics() {
        super.didSimulatePhysics()
        player.position.x += xAcceleration * 50
        if player.position.x < -70 {
            player.position.x = size.width + 70
        } else if player.position.x > self.size.width + 70 {
            player.position.x = -70
        }
    }
}
