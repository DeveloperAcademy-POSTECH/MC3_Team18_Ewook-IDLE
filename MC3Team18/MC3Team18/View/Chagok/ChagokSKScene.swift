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

enum MouthState{
    case none
    case a
    case e
    case i
    case o
    case u
}

class ChagokSKScene: SKScene, ObservableObject {
    
    var statusChanged: Bool = false
    var mouthState : MouthState = MouthState.none
    
    @Published var boxCount: Int = 0
    @Published var leftCupStack: [CupName] = []
    var isShuffleing = false
    
    override func update(_ currentTime: TimeInterval){
        
        if mouthA > 0.5 && mouthI > 0.65{
            if mouthState != MouthState.a{
                dropbox(cupname: CupName.RedCup)
                mouthState = MouthState.a
            }
        }
        
        if mouthA > 0.2 && mouthA < 0.4 && mouthI > 0.5{
            if mouthState != MouthState.e{
                dropbox(cupname: CupName.YellowCup)
                mouthState = MouthState.e
            }
        }
        
        if mouthI > 0.5 && mouthA < 0.15{
            if mouthState != MouthState.i{
                dropbox(cupname: CupName.GreenCup)
                mouthState = MouthState.i
            }
        }
        
        if mouthA > 0.5 && mouthI < 0.15{
            if mouthState != MouthState.o{
                dropbox(cupname: CupName.BlueCup)
                mouthState = MouthState.o
            }
        }
        
        if mouthU > 0.65 && mouthI < 0.5 && mouthA < 0.25{
            if mouthState != MouthState.u{
                dropbox(cupname: CupName.PinkCup)
                mouthState = MouthState.u
            }
        }
        
        if boxCount % 5 == 0 && boxCount > 0 {
            
            // 애니메이션 이펙트 상의해보기
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.removeAllChildren()
                self.leftCupStack.shuffle()
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
        boxCount += 1
    }
}
