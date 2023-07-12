//
//  ChagokSKScene.swift
//  MC3Team18
//
//  Created by NemoSquare on 7/12/23.
//

import ARKit
import RealityKit
import SpriteKit

class ChagokSKScene: SKScene {
    
    var statusChanged: Bool = false
    
    override func update(_ currentTime: TimeInterval){
        if publicJawValue > 0.5{
            if jawDrop == false{
                dropbox()
                jawDrop = true
                mouthLeftAndRightDrop = false
            }
        }
        if publicMouthLeftAndRight > 0.5{
            if mouthLeftAndRightDrop == false{
                dropbox()
                mouthLeftAndRightDrop = true
                jawDrop = false
            }
        }
    }
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        removeAllChildren()
        jawDrop = false
    }
    
    func dropbox() {
        
        print("Drop dropbox()")
        
        let box = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        box.position = CGPoint(x: size.width / 2, y: size.height / 2)
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        box.physicsBody?.allowsRotation = false
        box.physicsBody?.restitution = 0
        addChild(box)
        
        print("Drop x \(size.width / 2), y : \(size.height / 2)")

    }
}
