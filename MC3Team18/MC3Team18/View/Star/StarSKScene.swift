//
//  StarSKScene.swift
//  MC3Team18
//
//  Created by NemoSquare on 7/24/23.
//

import SwiftUI
import SpriteKit

struct StarSKScene_SwiftUIPreview: View {
    
    @StateObject var starSKScene = StarSKScene(size: CGSize(width: 150, height: 300))
    
    var body: some View {
        VStack {
            SpriteView(scene: starSKScene, options: [.allowsTransparency])
                .frame(width: 300, height: 700)
            Button(action: {starSKScene.isButtonPressed.toggle()}, label: {Text("Press")})
            Button(action: {starSKScene.gravityEffect += 1}, label: {Text("Press")})
        }
    }
}

class StarSKScene: SKScene, ObservableObject {
    
    @Published var isButtonPressed : Bool = false
    
    var gravityField: SKFieldNode!
    var sprite: SKSpriteNode!
    var framerateTime : Int = 0
    var gravityEffect = -1
    
    override func update(_ currentTime: TimeInterval) {
        if isButtonPressed{
            framerateTime += 1
            if framerateTime == 30{
                framerateTime = 0
                AddParticle()
            }
        }
    }
    override func didMove(to view: SKView) {
        
    }
    
    func AddParticle() {
        sprite = SKSpriteNode(imageNamed: "PinkCup")
        sprite.size = CGSize(width: 30, height: 30)
        
        sprite.position = CGPoint(
            x:CGFloat(Int(size.width/2)+Int.random(in:-3...3)),
            y: size.height - 250)
                
        var moveAction = SKAction.move(to: CGPoint(x: Double.random(in: 0...150), y: Double.random(in: 150...300)), duration: 1)
        
        var sizeAction = SKAction.scale(by: 1.5, duration: 1)
        
        self.addChild(sprite)
        sprite.run(moveAction)
        sprite.run(sizeAction)
        
    }
    
}

struct StarSKScenePreviews: PreviewProvider{
    static var previews: some View {
        StarSKScene_SwiftUIPreview()
    }
}


struct ContentView: View {
    
    @State var testScene: TestScene = TestScene(size: CGSize(width: 150, height: 300))
    
    var body: some View {
        VStack {
            SpriteView(scene: testScene, options: [.allowsTransparency])
                .frame(width: 150, height: 300)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class TestScene: SKScene, ObservableObject {
    
    var cupNode: SKSpriteNode = SKSpriteNode()
    var cupNode2: SKSpriteNode = SKSpriteNode()
    private var frameCount = 0
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity = CGVector(dx: 0, dy: -3)
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        if let skView = view as? SKView {
            skView.allowsTransparency = true
            skView.isOpaque = false
        }
        cupNode = SKSpriteNode(color: .blue, size: CGSize(width: 20, height: 20))
        cupNode.position = CGPoint(x: size.width / 2, y: size.height - 20)
        
        // Initialize the physics body for the cupNode
        cupNode.physicsBody = SKPhysicsBody(rectangleOf: cupNode.size)
        
        // Set the properties of the physics body
        cupNode.physicsBody?.affectedByGravity = false
        
        // Add the cupNode to the scene
        addChild(cupNode)
        
        cupNode2 = SKSpriteNode(color: .red, size: CGSize(width: 20, height: 20))
        cupNode2.position = CGPoint(x: size.width / 2, y: size.height - 20)
        
        // Initialize the physics body for the cupNode
        cupNode2.physicsBody = SKPhysicsBody(rectangleOf: cupNode.size)
        
        // Set the properties of the physics body
        cupNode2.physicsBody?.affectedByGravity = false
        
        // Add the cupNode to the scene
        addChild(cupNode2)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var moveAction = SKAction.move(to: CGPoint(x: 20, y: 30), duration: 3)
        cupNode.run(moveAction)
        moveAction = SKAction.move(to: CGPoint(x: 100, y: 100), duration: 5)
//        SKAction.sc
        cupNode2.run(moveAction)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        frameCount += 1
        
        if frameCount == 180 {
            frameCount = 0
//            cupNode = SKSpriteNode(color: .blue, size: CGSize(width: 20, height: 20))
//            cupNode.position = CGPoint(x: size.width / 2, y: size.height - 20)
//
//            // Initialize the physics body for the cupNode
//            cupNode.physicsBody = SKPhysicsBody(rectangleOf: cupNode.size)
//
//            // Set the properties of the physics body
//            cupNode.physicsBody?.affectedByGravity = false
//
//            // Add the cupNode to the scene
//            addChild(cupNode)
        }
        
        
    }
    
}
