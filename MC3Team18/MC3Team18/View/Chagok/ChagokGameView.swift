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
    
    @StateObject var chagokScene = ChagokSKScene(size: CGSize(width: 150, height: 360))
    @State var secondsx4 = 120
    
    @State var isRightCupVisiable: Bool = false
    @State var isBestScore: Bool = false
    @State var isFaceTracked = false
    @State var scoreScale: Double = 1.0
    
    @State var isStarted: Bool = false
    @State var tapToStartOpacity: Double = 1
    
    @AppStorage("isChagokTutorialDisabled") var isChagokTutorialDisabled: Bool = false
    @AppStorage("chagokScore") var chagokScore: String = "0"
    
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
                    Text(String(chagokScene.chagokScore))
                        .pretendardSemiBold24()
                        .foregroundColor(.Yellow)
                        .scaleEffect(scoreScale)
                    Spacer()
                    Button {
                        chagokStatus = .pause
                    } label: {
                        Image(systemName: "pause.fill")
                            .resizable()
                            .pretendardSemiBold20()
                            .frame(width: 16, height: 16)
                            .padding(.vertical, 3.5)
                            .padding(.horizontal, 4)
                            .opacity(chagokStatus == .tutorial ? 0 : 1)
                    }
                }
                .foregroundColor(.white)
                .padding(.bottom, 12)
                .frame(height: 29)
                HStack(spacing: 8) {
                    Image(systemName: "hourglass")
                        .resizable()
                        .scaledToFit()
                        .pretendardSemiBold20()
                        .frame(width: 15, height: 24)
                        .foregroundColor(.white)
                    Capsule()
                        .frame(height: 16)
                        .foregroundColor(.white).opacity(0.4)
                        .overlay {
                            GeometryReader { geo in
                                HStack {
                                    Capsule()
                                        .frame(height: 10)
                                        .frame(width: (geo.size.width - 10) * (CGFloat(secondsx4) / 120))
                                        .offset(y: -2)
                                        .foregroundColor(.white.opacity(0.9))
                                        .padding(5)
                                    
                                    Spacer()
                                }
                                .opacity(isRightCupVisiable ? 1 : 0)
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
                                    cupImage(cup: cup)
                                }
                            }
                            .frame(width: 150, height: 360)
                            .opacity(isRightCupVisiable ? 1 : 0)
                            .offset(y: 7)
                        }
                    Rectangle().frame(width: 155, height: 360).cornerRadius(12)
                        .overlay {
                            SpriteView(scene: chagokScene, options: [.allowsTransparency])
                                .frame(width: 150, height: 360)
                                .offset(y: 2)
                        }
                }
                .foregroundColor(.white.opacity(0.4))
                Spacer()
            }
            .padding(.top, 60)
            .padding(.horizontal, 34)
            
            VStack(spacing: 0) {
                Spacer()
                if isFaceTracked && chagokStatus != .tutorial {
                    if isStarted {
                        Button {
                            chagokScene.isNotUpdate = false
                            tapToStartOpacity = 0
                        } label: {
                            Text("Tap to start")
                                .pretendardSemiBold20()
                                .foregroundColor(.Yellow)
                                .shadow(color:.Yellow.opacity(0.85), radius: 8, x: 2, y: 2)
                        }
                        .opacity(tapToStartOpacity)
                        .padding(.bottom, 8)
                    }
                    
                    Image(ChagokFace.faceActive.rawValue)
                        .overlay {
                            VStack(alignment: .center, spacing: 0) {
                                Spacer().frame(height: 59)
                                Image("ChagokEyes")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 52)
                                    .padding(.bottom, 3)
                                // 기본 width 20 height 16
                                Image("ChagokMouth")
                                    .resizable()
                                    .frame(width: 20 + (20 * mouthWidth), height: 16 + (16 * mouthHeight))
                                Spacer()
                            }
                            
                        }
                        .offset(y: 52)
                        
                } else {
                    Image(ChagokFace.faceInactive.rawValue)
                        .offset(y: 52)
                        .overlay {
                            
                            VStack(alignment: .center, spacing: 10) {
                                Text(isStarted ? "얼굴이 인식되지 않습니다." : "얼굴이 인식되면 시작합니다.")
                                Text(isStarted ? "정면을 바라봐주세요!." : "기기를 정면으로 들어주세요.")
                            }
                            .pretendardSemiBold20()
                            .foregroundColor(.white)
                            .offset(y: 26)
                        }
                }
                ChagokARViewContainer(mouthHeight: $mouthHeight, mouthWidth: $mouthWidth, isFaceTracked: $isFaceTracked, isStarted: $isStarted, chagokStatus: $chagokStatus)
                    .frame(width: 0, height: 0)
                    .cornerRadius(20)
                    .shadow(radius: 3)
            }
            
            switch chagokStatus {
                
            case .tutorial:
                if(!isChagokTutorialDisabled){
                    ChagokTutorialView(chagokStatus: $chagokStatus, isChagokTutorialDisabled: $isChagokTutorialDisabled)
                        .environmentObject(chagokScene)
                        .transition(.opacity)
                }
            case .game:
                EmptyView()
            case .pause:
                ChagokPauseView(gameSelection: $gameSelection, chagokStatus: $chagokStatus, secondsx4: $secondsx4, isStarted: $isStarted, tapToStartOpacity: $tapToStartOpacity)
                    .environmentObject(chagokScene)
            case .gameover:
                ChagokGameOverView(gameSelection: $gameSelection, chagokStatus: $chagokStatus, isBestScore: $isBestScore, secondsx4: $secondsx4, isStarted: $isStarted, tapToStartOpacity: $tapToStartOpacity, chagokScore: $chagokScore)
                    .environmentObject(chagokScene)
            }
        }
        .statusBarHidden()
        .ignoresSafeArea()
        .onAppear {
            MusicPlayer.shared.stopBackgroundMusic()
            MusicPlayer.shared.startBackgroundMusic(musicName: SoundNames.chagokBGM.rawValue)
            // 다시보지 않기가 설정이 되었다면 게임으로 바로
            if isChagokTutorialDisabled {
                chagokStatus = .game
            }
            chagokScene.leftCupStack = CupName.allCases.shuffled()
            
            let timer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { _ in
                if self.secondsx4 > 0 {
                    if !chagokScene.isNotUpdate && isStarted {
                        withAnimation {
                            self.secondsx4 -= 1
                        }
                    }
                } else {
                    withAnimation(.easeOut(duration: 1)) {
                        chagokStatus = .gameover
                        self.secondsx4 = 120
                        if Int(chagokScore) ?? 0 <= chagokScene.chagokScore {
                            chagokScore = String(chagokScene.chagokScore)
                            self.isBestScore = true
                        }
                    }
                }
            }
            RunLoop.current.add(timer, forMode: .common)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation {
                    isRightCupVisiable = true
                }
            }
        }
        .onChange(of: chagokScene.isScaleEffect) { newValue in
            if newValue {
                withAnimation(.easeOut(duration: 0.3)) {
                    scoreScale = 1.3
                    secondsx4 += 4
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.easeIn(duration: 0.3)) {
                        scoreScale = 1.0
                    }
                }
            }
        }
        
    }
}

struct ChagokGameView_Previews: PreviewProvider {
    static var previews: some View {
        ChagokGameView(chagokStatus: .game, gameSelection: .constant(.chagok))
    }
}

extension ChagokGameView {
    
    func cupImage(cup: CupName) -> some View {
        
        Image(cup.rawValue)
            .resizable()
            .frame(width: cup == .YellowCup ? 118 : 113, height: 69)
    }
}
