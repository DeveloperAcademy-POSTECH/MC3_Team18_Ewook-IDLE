//
//  ChagokView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/11.
//

import ARKit
import RealityKit
import SpriteKit
import SwiftUI

//전역변수 : SKScene과 값을 공유해야 하는 변수들
public var publicJawValue : Double = 0
public var jawDrop : Bool = false
public var publicMouthLeftAndRight : Double = 0
public var mouthLeftAndRightDrop : Bool = false

struct ChagokGameView: View {
    
    //얼굴 표정 인식 변수
    @State var isJawOpen: Bool = false
    @State var isMouthLeftAndRight: Bool = false
    @State var mouthWidth: Double = 0
    @State var mouthHeight: Double = 0
    
    @Binding var chagokStatus: ChagokStatus
    
    @State var leftCupStack: [CupName] = []
    
    var scene: SKScene {
        let scene = ChagokSKScene()
        scene.size = CGSize(width: 150, height: 300)
        scene.scaleMode = .aspectFit
        scene.statusChanged = isJawOpen
        return scene
    }
    
    enum ChagokFace: String {
        case faceActive = "ChagokCharacterActive"
        case faceInactive = "ChagokCharacterInActive"
    }
    
    var body: some View {
        ZStack {
            Color.clear.overlay {
                Image("BackgroundChagok")
                    .resizable()
                    .scaledToFill()
            }
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("Score: ")
                        .pretendardRegular20()
                        .frame(height: 29)
                    Text("0")
                        .pretendardSemiBold24()
                        .foregroundColor(.Yellow)
                    Spacer()
                    Button {
                        chagokStatus = .pause
                    } label: {
                        Image(systemName: "pause.circle")
                            .resizable()
                            .pretendardSemiBold20()
                            .frame(width: 29, height: 29)
                    }
                }
                .foregroundColor(.white)
                .padding(.bottom, 5)
                .frame(height: 29)
                HStack(spacing: 4) {
                    Image(systemName: "hourglass")
                        .resizable()
                        .scaledToFit()
                        .pretendardSemiBold20()
                        .frame(width: 15, height: 24)
                        .foregroundColor(.white)
                    Spacer()
                    Capsule()
                        .frame(height: 16)
                        .foregroundColor(.white).opacity(0.4)
                        .overlay {
                            HStack {
                                Capsule()
                                    .frame(height: 10)
                                    .frame(width: 30)
                                    .foregroundColor(.white.opacity(0.9))
                                    .padding(5)
                                Spacer()
                            }
                        }
                }
                .frame(height: 31)
                .padding(.bottom, 17)
                HStack {
                    Rectangle().frame(width: 155, height: 360).cornerRadius(12)
                        .overlay {
                            VStack(alignment: .center, spacing: 0) {
                                ForEach(leftCupStack, id: \.rawValue) { cup in
                                    Image(cup.rawValue)
                                        .resizable()
                                        .frame(width: 92, height: 56)
                                }
                            }
                            .frame(width: 150, height: 300)
                        }
                    Rectangle().frame(width: 155, height: 360).cornerRadius(12)
                        .overlay {
                            SpriteView(scene: scene, options: [.allowsTransparency])
                                .frame(width: 150, height: 300)
                        }
                }
                .foregroundColor(.white.opacity(0.4))
                Spacer()
            }
            .padding(.top, 50)
            .padding(.horizontal, 32)
            
            VStack {
                Spacer()
                Image(ChagokFace.faceActive.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .offset(y: 20)
                    .overlay {
                        VStack(alignment: .center, spacing: 10) {
                            Image("ChagokEyes")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 74)
                            Image("ChagokMouth")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35)
                        }
                    }
                
                ChagokARViewContainer(jawOpen: $isJawOpen, isMouthLeftAndRight: $isMouthLeftAndRight, mouthHeight: $mouthHeight, mouthWidth: $mouthWidth)
                    .frame(width: 0, height: 0)
                    .cornerRadius(20)
                    .shadow(radius: 3)
            }
            
        }
        .statusBarHidden()
        .ignoresSafeArea()
        .onAppear {
            leftCupStack = CupName.allCases.shuffled()
        }
    }
}

struct ChagokGameView_Previews: PreviewProvider {
    static var previews: some View {
        ChagokGameView(chagokStatus: .constant(.game))
    }
}
