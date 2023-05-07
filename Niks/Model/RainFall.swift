//
//  RainFall.swift
//  Niks
//
//  Created by Abner Edgar on 07/05/23.
//
import Foundation
import SpriteKit

class RainFall: SKNode {
    
    init(image: SKSpriteNode){
        super.init()
        //        determine which side of the axis rain fall will spawn
        let randomNumber = arc4random_uniform(2)
        let x: CGFloat = randomNumber == 0 ? 1 : -1
        
        //        set the starting position of the node
        self.position = CGPoint(x: (CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.width))) * x), y: UIScreen.main.bounds.maxY - 112)
        //    set the size of the node
        self.setScale(0.05)
        
        //        apply a physixs body to the node
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "NAME-OF-YOUR-ASSET"), size: CGSize(width: image.size.width * 0.05, height: image.size.height * 0.05))
        
        //        set the bitmask properties
        self.physicsBody?.categoryBitMask = RainFallCategory
        self.physicsBody?.contactTestBitMask = floorCategory
        self.physicsBody?.collisionBitMask = playerCategory
        self.physicsBody?.usesPreciseCollisionDetection = true

        //        set the speed of rain
        self.physicsBody?.linearDamping = 5
        
        //    add image to the object
        self.addChild(image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
