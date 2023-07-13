//
//  ChagokSKScene.swift
//  MC3Team18
//
//  Created by NemoSquare on 7/12/23.
//

import ARKit
import RealityKit
import SpriteKit

enum CupName: String {
    case BlueCup = "BlueCup"
    case GreenCup = "GreenCup"
    case PinkCup = "PinkCup"
    case RedCup = "RedCup"
    case YellowCup = "YellowCup"
}


class ChagokSKScene: SKScene {
    
    var statusChanged: Bool = false
    
    override func update(_ currentTime: TimeInterval){
        if publicJawValue > 0.5 && publicMouthLeftAndRight < 0.5{
            if jawDrop == false{
                dropbox(cupname: CupName.BlueCup)
                jawDrop = true
                mouthLeftAndRightDrop = false
            }
        }
        if publicMouthLeftAndRight > 0.5 && publicJawValue < 0.5{
            if mouthLeftAndRightDrop == false{
                dropbox(cupname: CupName.GreenCup)
                mouthLeftAndRightDrop = true
                jawDrop = false
            }
        }
    }
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = .clear
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        if let skView = view as? SKView {
            skView.allowsTransparency = true
            skView.isOpaque = false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        removeAllChildren()
        jawDrop = false
    }
    
    func dropbox(cupname : CupName) {
        
        print("Drop dropbox()")
        
        let cupNode = SKSpriteNode(imageNamed: cupname.rawValue)
        cupNode.position = CGPoint(x: size.width / 2, y: size.height - 20)
        cupNode.size = CGSize(width: 92, height: 56)
        cupNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 92, height: 56))
        cupNode.physicsBody?.allowsRotation = false
        cupNode.physicsBody?.restitution = 0
        addChild(cupNode)
    }
}
