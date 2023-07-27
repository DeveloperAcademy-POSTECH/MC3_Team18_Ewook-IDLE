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
    @AppStorage("BubbleMissionSuccess") var BubbleMissionSuccess: Bool = false
    @AppStorage("BanjjakMissionSuccess") var BanjjakMissionSuccess: Bool = false
    @AppStorage("DailyRoutineCurrentDate") var DailyRoutineCurrentDate: String = ""
    
    var body: some View {
        ZStack {
            
            Color.clear.overlay {
                Image("BackgroundHomeVIew")
                    .resizable()
                    .scaledToFill()
            }
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
                        Spacer().frame(height: 40)
                        TrophyView(gameSelected: $gameSelected)
                        Spacer().frame(height: 10)
                        Button {
                            print("bubble")
                            withAnimation(.easeOut(duration: 0.3)) {
                                gameSelected = .bubble
                            }
                        } label: {
                            Image("ButtonBubble")
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
                            
                            withAnimation(.easeOut(duration: 0.3)) {
                                gameSelected = .banjjak
                            }
                        } label: {
                            Image("ButtonBanjjak")
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
            case .bubble:
                Color.clear.overlay {
                    BubbleStatusView(gameSelection: $gameSelected)
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
            case .banjjak:
                BanjjakGameView(gameSelection: $gameSelected)
                    .transition(.backslide)
                    .onAppear {
                        UIApplication.shared.isIdleTimerDisabled = true
                    }
            case .record:
                RecordView(gameSelected: $gameSelected)
                    .transition(.backslide)
                    .onAppear {
                        UIApplication.shared.isIdleTimerDisabled = true
                    }
            }
        }.onAppear{
            if DailyRoutineCurrentDate != currentDate{
                chagokMissionSuccess = false
                BubbleMissionSuccess = false
                BanjjakMissionSuccess = false
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
