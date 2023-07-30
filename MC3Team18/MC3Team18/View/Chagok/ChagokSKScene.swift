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
    @Published var boxLineCount : Int = 0
    @Published var leftCupStack: [CupName] = []
    @Published var rightCupStack: [CupName] = []
    
    @Published var chagokScore: Int = 0
    
    @Published var isNotUpdate = true
    
    @Published var isScaleEffect: Bool = false
    
    var isShuffleing = false
    var currentIndex = 4
    
    override func update(_ currentTime: TimeInterval) {
        if isNotUpdate {
            return
        }
        
        if mouthA > 0.45 && mouthI > 0.45 {
            if mouthState != MouthState.a && leftCupStack[self.currentIndex] == CupName.RedCup {
                dropbox(cupname: CupName.RedCup)
                mouthState = MouthState.a
                self.currentIndex = self.currentIndex == 0 ? 4 : self.currentIndex - 1
            }
        }
        
        if mouthE > 0.5 && mouthU < 0.5{
            if mouthState != MouthState.e && leftCupStack[self.currentIndex] == CupName.YellowCup {
                dropbox(cupname: CupName.YellowCup)
                mouthState = MouthState.e
                self.currentIndex = self.currentIndex == 0 ? 4 : self.currentIndex - 1
            }
        }
        
        if mouthI > 0.5 && mouthA < 0.15 {
            if mouthState != MouthState.i && leftCupStack[self.currentIndex] == CupName.GreenCup {
                dropbox(cupname: CupName.GreenCup)
                mouthState = MouthState.i
                self.currentIndex = self.currentIndex == 0 ? 4 : self.currentIndex - 1
            }
        }
        
        if mouthA > 0.5 && mouthI < 0.15 && leftCupStack[self.currentIndex] == CupName.BlueCup {
            if mouthState != MouthState.o{
                dropbox(cupname: CupName.BlueCup)
                mouthState = MouthState.o
                self.currentIndex = self.currentIndex == 0 ? 4 : self.currentIndex - 1
            }
        }
        
        if mouthU > 0.65 && mouthI < 0.5 && mouthA < 0.25 && mouthE < 0.25 && leftCupStack[self.currentIndex] == CupName.PinkCup{
            if mouthState != MouthState.u{
                dropbox(cupname: CupName.PinkCup)
                mouthState = MouthState.u
                self.currentIndex = self.currentIndex == 0 ? 4 : self.currentIndex - 1
            }
        }
        
        if boxCount == 5 {
            isNotUpdate = true
            chagokScore += 1000
            self.isScaleEffect = true
            
            self.leftCupStack.shuffle()
            self.boxCount = 0
            self.boxLineCount += 1
            // 애니메이션 이펙트 상의해보기
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.removeAllChildren()
                self.mouthState = MouthState.none
                self.isNotUpdate = false
                HapticManager.instance.notification(type: .error)
                SoundEffectPlayer.shared.playSoundEffect(soundName: SoundNames.chagokPungEffect.rawValue)
                self.isScaleEffect = false
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
    
    func dropbox(cupname : CupName) {
        
        if isNotUpdate {
            return
        }
        addChild(cupImage(cup: cupname))
        rightCupStack.append(cupname)
        boxCount += 1
        // 박스가 떨어질때 마다 스코어가 추가되어야 합니다.
        chagokScore += 100
        
    }
}

extension ChagokSKScene {

    func cupImage(cup: CupName) -> SKNode {

        let cupNode = SKSpriteNode(imageNamed: cup.rawValue)
        cupNode.position = CGPoint(x: size.width / 2, y: size.height - 20)
        cupNode.size = CGSize(width: cup == .YellowCup ? 100 : 92, height: 56)
        cupNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 56))
        cupNode.physicsBody?.allowsRotation = false
        cupNode.physicsBody?.restitution = 0
        return cupNode
    }
}
