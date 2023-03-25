//
//  PowerUp.swift
//  WarFly
//
//  Created by Konstantin Pimbursky on 25.03.2023.
//

import SpriteKit

class PowerUp: SKSpriteNode {
    let initialSize = CGSize(width: 52, height: 52)
    let textureAtlas = SKTextureAtlas(named: "GreenPowerUp")
    var animationSpriteArray = [SKTexture]()
    
    init() {
        let greenTexture = textureAtlas.textureNamed("missle_green_01")
        super.init(texture: greenTexture, color: .clear, size: initialSize)
        name = "powerUp"
        zPosition = 20
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func performRotation() {
        for i in 1...15 {
            let number = String(format: "%02d", i)
            animationSpriteArray.append(SKTexture(imageNamed: "missle_green_\(number)"))
        }
        SKTexture.preload(animationSpriteArray) { [unowned self] in
            let rotation = SKAction.animate(
                with: self.animationSpriteArray,
                timePerFrame: 0.05,
                resize: true,
                restore: false
            )
            let rotationForever = SKAction.repeatForever(rotation)
            self.run(rotationForever)
        }
    }
}
