//
//  HomeView.swift
//  MC3Team18
//
//  Created by 077tech on 2023/07/11.
//

import SwiftUI
import AVKit

struct HomeView: View {
    
    @Binding var gameSelected: GameSelection
    @AppStorage("chagokMissionSuccess") var chagokMissionSuccess: Bool = false
    @AppStorage("BalloonMissionSuccess") var BalloonMissionSuccess: Bool = false
    @AppStorage("StarMissionSuccess") var StarMissionSuccess: Bool = false
    @AppStorage("DailyRoutineCurrentDate") var DailyRoutineCurrentDate: String = ""
    
    var body: some View {
        
        
        
        ZStack {
            
            Image("BackgroundHomeVIew")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            switch gameSelected {
            case .none:
                ZStack{
                    Color.clear.overlay {
                        Image("BackgroundHomeVIew")
                            .resizable()
                            .scaledToFill()
                    }.ignoresSafeArea()
                    VStack(spacing: 20) {
                        Spacer()
                        TrophyView(gameSelected: $gameSelected)
                        Spacer()
                        Button {
                            print("bubble")
                            withAnimation(.easeOut(duration: 0.3)) {
                                gameSelected = .bubbleGum
                            }
                        } label: {
                            Image("ButtonBalloon")
                        }
                        Button {
                            print("chagok")
                            withAnimation(.easeOut(duration: 0.3)) {
                                gameSelected = .chagok
                            }
                        } label: {
                            Image("ButtonCupStack")
                        }
                        Button {
                            print("chagok")
                            withAnimation(.easeOut(duration: 0.3)) {
                                gameSelected = .star
                            }
                        } label: {
                            Image("ButtonStar")
                        }
                        Spacer()
                    }
                }
                .statusBarHidden()
                .ignoresSafeArea()
                .transition(.slide)
                .onAppear {
                    MusicPlayer.shared.stopBackgroundMusic()
                    MusicPlayer.shared.startBackgroundMusic(musicName: "homescreenBGM")
                    UIApplication.shared.isIdleTimerDisabled = false
                }
            case .bubbleGum:
                Color.clear.overlay {
                    BubbleGumStatusView(gameSelection: $gameSelected)
                }
                .transition(.backslide)
                .onAppear {
                    UIApplication.shared.isIdleTimerDisabled = true
                }
            case .chagok:
                ChagokGameView(gameSelection: $gameSelected)
                    .transition(.backslide)
                    .onAppear {
                        UIApplication.shared.isIdleTimerDisabled = true
                    }
            case .star:
                Text("star game")
                    .transition(.backslide)
                    .onAppear {
                        UIApplication.shared.isIdleTimerDisabled = true
                    }
            case .record:
                MenuView(gameSelected: $gameSelected)
                    .transition(.backslide)
                    .onAppear {
                        UIApplication.shared.isIdleTimerDisabled = true
                    }
            }
        }.onAppear{
            if DailyRoutineCurrentDate != currentDate{
                chagokMissionSuccess = false
                BalloonMissionSuccess = false
                StarMissionSuccess = false
                DailyRoutineCurrentDate = currentDate
            }
        }
    }
    
    var currentDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: Date())
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(gameSelected: .constant(.none))
        MultiPreview {
            HomeView(gameSelected: .constant(.none))
        }
        
    }
}
