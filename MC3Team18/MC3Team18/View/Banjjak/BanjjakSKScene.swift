//
//  BanjjakSKScene.swift
//  MC3Team18
//
//  Created by NemoSquare on 7/24/23.
//

import SwiftUI
import SpriteKit

class BanjjakSKScene: SKScene, ObservableObject {
    
    @Published var isTrill: Bool = false
    @Published var score: Int = 0
    @Published var isStarted: Bool = false
    
    private let starImageNames : [String] = ["WhiteStar","YellowStar"]
    
    var gravityField: SKFieldNode!
    var sprite: SKSpriteNode!
    var framerateTime : Int = 30
    var gravityEffect = -1
    
    override func update(_ currentTime: TimeInterval) {
        
        if isTrill && isStarted {
            framerateTime -= 1
            if framerateTime == 0 {
                framerateTime = 30
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
        sprite = SKSpriteNode(imageNamed: starImageNames[Int.random(in: 0...1)])
        sprite.size = CGSize(width: 28, height: 27)
        
        sprite.position = CGPoint(
            x: CGFloat(Int(size.width/2)),
            y: 129)
        var moveAction = SKAction.move(to: CGPoint(
            x: Double.random(in: 20...size.width - 20),
            y: Double.random(in: size.height * 0.3 ... size.height - 19)), duration: 3)
        var sizeAction = SKAction.scale(by: Double.random(in: 0.7...1.4), duration: 1)
        
        self.addChild(sprite)
        sprite.run(moveAction) {
            self.score += 300
        }
        sprite.run(sizeAction)
        
    }
    
}
