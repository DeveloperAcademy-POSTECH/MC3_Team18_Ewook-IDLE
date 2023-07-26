//
//  StarGameView.swift
//  MC3Team18
//
//  Created by Lee Jinhee on 2023/07/23.
//

import SwiftUI
import _SpriteKit_SwiftUI

struct StarGameView: View {
    @State var starStatus: StarStatus = .tutorial
    @Binding var gameSelection: GameSelection
    @State var secondsx4: Int = 120
    @State var gameOpacity: Double = 0
    @StateObject var starSKScene: StarSKScene = StarSKScene()
    
    @State var isBestScore: Bool = false
    
    @ObservedObject var observer: StarAudioStreamObserver  = StarAudioStreamObserver()
    @ObservedObject var streamManager: StarAudioStreamManager = StarAudioStreamManager()
    
    @State var banzzakCharacterImage = Image("BanzzakDefault")
    
    init(gameSelection: Binding<GameSelection>) {
        _gameSelection = gameSelection
        streamManager.resultObservation(with: observer)
        streamManager.startAudioStream()
        print("ONONINIT")
    }
    
    var body: some View {
        ZStack {
            Color.clear.overlay {
                Image("BackgroundStar")
                    .resizable()
                    .scaledToFill()
            }
            VStack {
                Spacer()
                banzzakCharacterImage
                    .resizable()
                    .frame(width: 120, height: 137)
                    .offset(y:-49)
            }
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("Score: ")
                        .pretendardRegular20()
                        .frame(height: 29)
                    Text("\(starSKScene.score)")
                        .pretendardSemiBold24()
                        .foregroundColor(.Yellow)
                        .onTapGesture {
                            starSKScene.isTrill.toggle()
                        }
                    //TODO: ScaleEffect
                    Spacer()
                    Button {
                        //TODO: starState = 일시정지
                        starSKScene.isPaused = true
                        starStatus = StarStatus.pause
                    } label: {
                        Image(systemName: "pause.fill")
                            .resizable()
                            .pretendardSemiBold20()
                            .frame(width: 16, height: 16)
                            .padding(.vertical, 3.5)
                            .padding(.horizontal, 4)
                    }
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
                        SpriteView(scene: starSKScene, options: [.allowsTransparency])
                            .frame(width: CGFloat(geo.size.width), height: CGFloat(geo.size.height))
                            .onAppear {
                                starSKScene.size = CGSize(width: geo.size.width, height: geo.size.height)
                            }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding(.top, 50)
            .padding(.bottom, 32)
            
            switch starStatus {
            case .tutorial:
                // TODO: UserDefaults의 튜토리얼 변수 조건에 따라 visible
                StarTutorialView(starStatus: $starStatus)
                    .environmentObject(starSKScene)
                    .transition(.opacity)
            case .game:
                EmptyView()
            case .pause:
                StarPauseView(starStatus: $starStatus, gameSelection: $gameSelection, secondsx4: $secondsx4)
                    .environmentObject(starSKScene)
                    .environmentObject(streamManager)
            case .gameover:
                StarGameOverView(starStatus: $starStatus, secondsx4: $secondsx4, gameSelection: $gameSelection, isBestScore: $isBestScore)
                    .environmentObject(starSKScene)
                    .environmentObject(streamManager)
                
            }
        }
        .statusBarHidden()
        .ignoresSafeArea()
        .opacity(gameOpacity)
        .onAppear {
            withAnimation(.easeOut(duration: 0.3)) {
                gameOpacity = 1
            }
            let timer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { _ in
                if self.secondsx4 > 0 {
                    if !starSKScene.isPaused && starStatus != .tutorial {
                        withAnimation {
                            self.secondsx4 -= 1
                        }
                    }
                } else {
                    withAnimation(.easeOut(duration: 1)) {
                        starStatus = StarStatus.gameover
                        self.secondsx4 = 120
                        checkBestScore()
                    }
                }
            }
            RunLoop.current.add(timer, forMode: .common)
        }
        .onChange(of: observer.topResults) { _ in
            if observer.currentSound == "Trill" {
                starSKScene.isTrill = true
                banzzakCharacterImage = Image("BanzzakTrill")
            } else {
                starSKScene.isTrill = false
                banzzakCharacterImage = Image("BanzzakDefault")
            }
        }
    }
    func checkBestScore() {
        if UserDefaults.standard.integer(forKey: "starScore") <= starSKScene.score {
            UserDefaults.standard.set(starSKScene.score, forKey: "starScore")
            self.isBestScore = true
        }
    }
}

//struct StarGameView_Previews: PreviewProvider {
//    static var previews: some View {
//        StarGameView(gameSelection: .constant(.star))
//    }
//}
