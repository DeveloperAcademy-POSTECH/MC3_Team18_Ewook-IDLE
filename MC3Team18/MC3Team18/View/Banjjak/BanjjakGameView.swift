//
//  BanjjakGameView.swift
//  MC3Team18
//
//  Created by Lee Jinhee on 2023/07/23.
//

import SwiftUI
import _SpriteKit_SwiftUI

struct BanjjakGameView: View {
    @State var banjjakStatus: BanjjakStatus = .tutorial
    @Binding var gameSelection: GameSelection
    @State var secondsx4: Int = 120
    @State var gameOpacity: Double = 0
    @StateObject var banjjakSKScene: BanjjakSKScene = BanjjakSKScene()
    
    @State var isBestScore: Bool = false
    
    @ObservedObject var observer: BanjjakAudioStreamObserver  = BanjjakAudioStreamObserver()
    @ObservedObject var streamManager: BanjjakAudioStreamManager = BanjjakAudioStreamManager()
    
    @State var banjjakCharacterImage = Image("BanjjakDefault")
    
    @AppStorage("banjjakScore") var banjjakScore: String = "0"
    @EnvironmentObject var shopItemVM: ShopItemViewModel

    init(gameSelection: Binding<GameSelection>) {
        _gameSelection = gameSelection
        streamManager.resultObservation(with: observer)
        streamManager.startAudioStream()
        print("ONONINIT")
    }
    
    var body: some View {
        ZStack {
            Color.clear.overlay {
                Image("BackgroundBanjjak")
                    .resizable()
                    .scaledToFill()
            }
            VStack {
                Spacer()
                banjjakCharacterImage
                    .resizable()
                    .frame(width: 120, height: 137)
                    .offset(y:-49)
                    .overlay {
                        Image(shopItemVM.selectedAcc?.itemName ?? "")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(0.3)
                            //.offset(y: -44)
                            .offset(y:shopItemVM.selectedAcc?.itemName == "mustache" ? -51 : -42 )
                            .offset(x: CGFloat(shopItemVM.selectedAcc?.x ?? 0), y: CGFloat(shopItemVM.selectedAcc?.y ?? 0))
                            .shadow(color: .Black.opacity(0.16), radius: 6, x: 4, y: 4)
                    }
                    .opacity(banjjakStatus != .tutorial ? 1 : 0)
            }
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("Score: ")
                        .pretendardRegular20()
                        .frame(height: 29)
                    Text(String(banjjakSKScene.score))
                        .pretendardSemiBold24()
                        .foregroundColor(.Yellow)
                        .onTapGesture {
                            banjjakSKScene.isTrill.toggle()
                        }
                    //TODO: ScaleEffect
                    Spacer()
                    Button {
                        banjjakSKScene.isPaused = true
                        banjjakStatus = BanjjakStatus.pause
                    } label: {
                        Image(systemName: "pause.fill")
                            .resizable()
                            .pretendardSemiBold20()
                            .frame(width: 16, height: 16)
                            .padding(.vertical, 3.5)
                            .padding(.horizontal, 4)
                    }
                    .opacity(banjjakStatus != .tutorial ? 1 : 0)
                }
                .foregroundColor(.white)
                .padding(.bottom, 5)
                .frame(height: 29)
                .padding(.horizontal, 34)
                
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
                                        .offset(y: -1)
                                        .foregroundColor(Color.white.opacity(0.9))
                                        .padding(4)
                                    Spacer()
                                }
                            }
                        }
                }
                .frame(height: 31)
                .padding(.horizontal, 34)
                
                VStack {
                    GeometryReader { geo in
                        SpriteView(scene: banjjakSKScene, options: [.allowsTransparency])
                            .frame(width: CGFloat(geo.size.width), height: CGFloat(geo.size.height))
                            .onAppear {
                                banjjakSKScene.size = CGSize(width: geo.size.width, height: geo.size.height)
                            }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding(.top, 50)
            .padding(.bottom, 32)
            if !banjjakSKScene.isStarted {
                VStack {
                    Spacer().frame(height: 261)
                    Text("소리를 내면 시작합니다.")
                        .pretendardSemiBold24()
                        .foregroundColor(.white)
                    Spacer()
                }
                .opacity(banjjakStatus != .tutorial ? 1 : 0)
            }
            
            switch banjjakStatus {
            case .tutorial:
                BanjjakTutorialView(banjjakStatus: $banjjakStatus)
                    .environmentObject(banjjakSKScene)
                    .transition(.opacity)
            case .game:
                EmptyView()
            case .pause:
                BanjjakPauseView(banjjakStatus: $banjjakStatus, gameSelection: $gameSelection, secondsx4: $secondsx4)
                    .environmentObject(banjjakSKScene)
                    .environmentObject(streamManager)
            case .gameover:
                BanjjakGameOverView(banjjakStatus: $banjjakStatus, secondsx4: $secondsx4, gameSelection: $gameSelection, isBestScore: $isBestScore, banjjakScore: $banjjakScore)
                    .environmentObject(banjjakSKScene)
                    .environmentObject(streamManager)
            }
        }
        .statusBarHidden()
        .ignoresSafeArea()
        .opacity(gameOpacity)
        .onAppear {
            if shopItemVM.selectedStar == nil {
                banjjakSKScene.starImageNames = ["WhiteStar", "YellowStar"]
            } else {
                banjjakSKScene.starImageNames = ["WhiteStar", shopItemVM.selectedStar!.itemName]
            }
            withAnimation(.easeOut(duration: 0.3)) {
                gameOpacity = 1
            }
            let timer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { _ in
                if self.secondsx4 > 0 {
                    if !banjjakSKScene.isPaused && banjjakStatus != .tutorial && banjjakSKScene.isStarted {
                        withAnimation {
                            self.secondsx4 -= 1
                        }
                    }
                } else {
                    withAnimation(.easeOut(duration: 1)) {
                        banjjakStatus = BanjjakStatus.gameover
                        self.secondsx4 = 120
                        checkBestScore()
                    }
                }
            }
            RunLoop.current.add(timer, forMode: .common)
        }
        .onChange(of: observer.topResults) { _ in
            banjjakSKScene.framerateTime = 1
            if observer.currentSound == "Trill" && banjjakStatus != .tutorial {
                banjjakSKScene.isTrill = true
                banjjakSKScene.isStarted = true
                banjjakCharacterImage = Image("BanjjakTrill")
            } else {
                banjjakSKScene.isTrill = false
                banjjakCharacterImage = Image("BanjjakDefault")
            }
        }
    }
    func checkBestScore() {
        let banjjackHighScoreInt: Int = Int(banjjakScore) ?? 0
        if banjjackHighScoreInt <= banjjakSKScene.score {
            banjjakScore = String(banjjakSKScene.score)
            self.isBestScore = true
        }
    }
}

//struct BanjjakGameView_Previews: PreviewProvider {
//    static var previews: some View {
//        BanjjakGameView(gameSelection: .constant(.banjjak))
//    }
//}
