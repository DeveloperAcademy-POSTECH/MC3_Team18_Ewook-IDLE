//
//  ChagokSKScene.swift
//  MC3Team18
//
//  Created by NemoSquare on 7/12/23.
//

import ARKit
import RealityKit
import SpriteKit

enum CupName: String, CaseIterable {
    case BlueCup = "BlueCup"
    case GreenCup = "GreenCup"
    case PinkCup = "PinkCup"
    case RedCup = "RedCup"
    case YellowCup = "YellowCup"
}


class ChagokSKScene: SKScene {
    
    var statusChanged: Bool = false
    
    override func update(_ currentTime: TimeInterval){
        if mouthA > 0.5 && mouthE < 0.5{
            if isMouthA == false{
                dropbox(cupname: CupName.BlueCup)
                isMouthA = true
                isMouthI = false
            }
        }
        if mouthE > 0.5 && mouthA < 0.5{
            if isMouthI == false{
                dropbox(cupname: CupName.GreenCup)
                isMouthI = true
                isMouthA = false
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
        isMouthA = false
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
