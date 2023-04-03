//
//  Enemy.swift
//  WarFly
//
//  Created by Konstantin Pimbursky on 03.04.2023.
//

import SpriteKit

class Enemy: SKSpriteNode {
	
    // MARK: - Public Properties
    
    static var textureAtlas: SKTextureAtlas?
    
    init() {
        let texture = Enemy.textureAtlas?.textureNamed("airplane_4ver2_13")
        super.init(texture: texture, color: .clear, size: CGSize(width: 221, height: 204))
        xScale = 0.5
        yScale = -0.5
        zPosition = 20
        name = "sprite"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
