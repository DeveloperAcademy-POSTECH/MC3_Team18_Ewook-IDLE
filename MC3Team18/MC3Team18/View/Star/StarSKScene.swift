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
        SpriteView(scene: starSKScene, options: [.allowsTransparency])
            .frame(width: 300, height: 700)
    }
}

class StarSKScene: SKScene, ObservableObject {
    
}

struct StarSKScenePreviews: PreviewProvider{
    static var previews: some View {
        StarSKScene_SwiftUIPreview()
    }
}
