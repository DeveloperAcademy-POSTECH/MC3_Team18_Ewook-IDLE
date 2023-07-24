//
//  StarSKScene.swift
//  MC3Team18
//
//  Created by NemoSquare on 7/24/23.
//

import SwiftUI
import SpriteKit

class StarSKScene: SKScene, ObservableObject {
    
    @Published var isGaming : Bool = true
    @Published var isTrill: Bool = false
    @Published var score: Int = 0
    
    var gravityField: SKFieldNode!
    var sprite: SKSpriteNode!
    var framerateTime : Int = 0
    var gravityEffect = -1
    
    override func update(_ currentTime: TimeInterval) {
        
//        if !isGaming {
//            return
//        }
        
        if isGaming{
            framerateTime += 1
            if framerateTime == 60 {
                framerateTime = 0
                AddParticle()
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
    
    func AddParticle() {
        sprite = SKSpriteNode(imageNamed: "PinkCup")
        sprite.size = CGSize(width: 15, height: 15)
        
        sprite.position = CGPoint(
            x: CGFloat(Int(size.width/2)+Int.random(in:-3...3)),
            y: 80)
        var moveAction = SKAction.move(to: CGPoint(
            x: Double.random(in: 20...size.width - 20),
            y: Double.random(in: size.height * 0.6 ... size.height)),                          duration: 3)
        var sizeAction = SKAction.scale(by: 1.5, duration: 1)
        self.addChild(sprite)
        sprite.run(moveAction) {
            self.score += 100
        }
        sprite.run(sizeAction)
        
    }
    
}
