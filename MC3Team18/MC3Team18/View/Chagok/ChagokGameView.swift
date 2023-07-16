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
public var mouthA : Double = 0 //입모양 "아"
public var mouthE : Double = 0 //입모양 "에"
public var mouthI : Double = 0 //입모양 "이"
public var mouthO : Double = 0 //입모양 "오"
public var mouthU : Double = 0 //입모양 "우"

public var isMouthA : Bool = false
public var isMouthE : Bool = false
public var isMouthI : Bool = false
public var isMouthO : Bool = false
public var isMouthU : Bool = false

struct ChagokGameView: View {
    
    //얼굴 표정 인식 변수
    @State var isJawOpen: Bool = false
    @State var isMouthLeftAndRight: Bool = false
    @State var mouthWidth: Double = 0
    @State var mouthHeight: Double = 0
    
    @State var chagokStatus: ChagokStatus = .tutorial
    @Binding var gameSelection: GameSelection
    
    @StateObject var chagokScene = ChagokSKScene(size: CGSize(width: 150, height: 300))
    @State var secondsx4 = 120
    
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
                    Text("\(chagokScene.chagokScore)")
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
                            
                            GeometryReader { geo in
                                
                                HStack {
                                    Capsule()
                                        .frame(height: 10)
                                        .frame(width: (geo.size.width - 10) * (CGFloat(secondsx4) / 120))
                                        .offset(y: -1.5)
                                        .foregroundColor(.white.opacity(0.9))
                                        .padding(5)
                                        
                                    Spacer()
                                }
                                
                                .onAppear {
                                    print("geo : \(geo.size.width)")
                                }
                                
                                
                            }
                        }
                }
                .frame(height: 31)
                .padding(.bottom, 17)
                HStack {
                    Rectangle().frame(width: 155, height: 360).cornerRadius(12)
                        .overlay {
                            VStack(alignment: .center, spacing: 0) {
                                ForEach(chagokScene.leftCupStack, id: \.rawValue) { cup in
                                    Image(cup.rawValue)
                                        .resizable()
                                        .frame(width: 92, height: 56)
                                }
                            }
                            .frame(width: 150, height: 300)
                        }
                    Rectangle().frame(width: 155, height: 360).cornerRadius(12)
                        .overlay {
                            SpriteView(scene: chagokScene, options: [.allowsTransparency])
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
                            
                                .frame(width: 35 * (1 + mouthWidth), height: 26 * (1 + mouthHeight))
                        }
                    }
                
                ChagokARViewContainer(mouthHeight: $mouthHeight, mouthWidth: $mouthWidth)
                    .frame(width: 0, height: 0)
                    .cornerRadius(20)
                    .shadow(radius: 3)
            }
            
            switch chagokStatus {
                
            case .tutorial:
                if(!UserDefaults.standard.bool(forKey: "isTutorialDisabled")){
                    ChagokTutorialView(chagokStatus: $chagokStatus)
                        .environmentObject(chagokScene)
                }
            case .game:
                EmptyView()
            case .pause:
                ChagokPauseView(gameSelection: $gameSelection, chagokStatus: $chagokStatus, secondsx4: $secondsx4)
                    .environmentObject(chagokScene)
            case .gameover:
                ChagokGameOverView(gameSelection: $gameSelection, chagokStatus: $chagokStatus)
                    .environmentObject(chagokScene)
            }
        }
        .statusBarHidden()
        .ignoresSafeArea()
        .onAppear {
            // 다시보지 않기가 설정이 되었다면 게임으로 바로
            if UserDefaults.standard.bool(forKey: "isTutorialDisabled") {
                chagokStatus = .game
            }
            chagokScene.leftCupStack = CupName.allCases.shuffled()
            
            let timer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { _ in
                if self.secondsx4 > 0 {
                    if !chagokScene.isPaused && !chagokScene.isTutorial {
                        withAnimation {
                            self.secondsx4 -= 1
                        }
                    }
                } else {
                    withAnimation(.easeOut(duration: 1)) {
                        chagokStatus = .gameover
                        self.secondsx4 = 120
                        if Int(UserDefaults.standard.string(forKey: "chagokScore") ?? "0" )! <= chagokScene.chagokScore {
                                UserDefaults.standard.set(chagokScene.chagokScore, forKey: "chagokScore")
                            }
                    }
                }
            }
            RunLoop.current.add(timer, forMode: .common)
        }
        .onChange(of: chagokStatus) { newValue in
            if newValue == .pause || newValue == .gameover {
                // 게임을 일시정지 하는 코드를 만듭니다.
            }
        }
    }
}

struct ChagokGameView_Previews: PreviewProvider {
    static var previews: some View {
        ChagokGameView(chagokStatus: .game, gameSelection: .constant(.chagok))
    }
}
