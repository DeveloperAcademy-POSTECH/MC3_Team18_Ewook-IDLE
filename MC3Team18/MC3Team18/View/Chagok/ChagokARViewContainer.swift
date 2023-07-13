//
//  ChagokARViewContainer.swift
//  MC3Team18
//
//  Created by NemoSquare on 7/12/23.
//

import ARKit
import Foundation
import RealityKit
import SwiftUI


struct ChagokARViewContainer: UIViewRepresentable {
    
    @Binding var jawOpen: Bool
    @Binding var isMouthLeftAndRight: Bool
    @Binding var mouthHeight: Double
    @Binding var mouthWidth: Double
    
    func makeUIView(context: Context) -> some UIView {
        
        let arView = ARView(frame: .zero)
        let config = ARFaceTrackingConfiguration()
        
        config.isWorldTrackingEnabled = false
        config.isLightEstimationEnabled = true
        
        let faceAnchor = AnchorEntity(.face)
        faceAnchor.name = "faceAnchor"
        arView.scene.addAnchor(faceAnchor)
        
        let cameraAnchor = AnchorEntity(.camera)
        cameraAnchor.name = "cameraAnchor"
        arView.scene.addAnchor(cameraAnchor)
        arView.session.run(config, options: [])
        arView.session.delegate = context.coordinator
        
        return arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

extension ChagokARViewContainer {
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, ARSessionDelegate {

        var parent: ChagokARViewContainer?
        var jawOpen: Double = 0
        var mouthLeft: Double = 0
        var mouthRight: Double = 0
        var mouthPucker: Double = 0
        
        init(parent: ChagokARViewContainer) {
            self.parent = parent
        }

        func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
            guard let faceAnchor = anchors.first(where: { $0 is ARFaceAnchor }) as? ARFaceAnchor else {
                return
            }

            jawOpen = faceAnchor.blendShapes[.jawOpen]!.doubleValue
            mouthLeft = faceAnchor.blendShapes[.mouthSmileLeft]!.doubleValue
            mouthRight = faceAnchor.blendShapes[.mouthSmileRight]!.doubleValue
            mouthPucker = faceAnchor.blendShapes[.mouthPucker]!.doubleValue

//            parent?.mouthHeight = jawOpen
//            parent?.mouthWidth = mouthLeft + mouthRight / 2

//            parent?.jawOpen = jawOpen > 0.2
//            print("jawOpen : \(jawOpen)")
//            parent?.isMouthLeftAndRight = mouthLeft > 0.2 && mouthRight > 0.2
            
            mouthA = jawOpen
            mouthI = (mouthLeft + mouthRight) / 2
            mouthU = mouthPucker
            print("mouthLeft: \(mouthLeft)")
            print("mouthRight: \(mouthRight)")
        }

    }

}
