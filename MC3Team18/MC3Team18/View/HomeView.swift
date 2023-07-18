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
    
    var body: some View {
        
        ZStack {
            Image("BackgroundHomeVIew")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            switch gameSelected {
            case .none:
                ZStack{
                    Image("BackgroundHomeVIew")
                        .resizable()
                        .scaledToFill()
                    
                    VStack {
                        Button {
                            print("bubble")
                            MusicPlayer.shared.stopBackgroundMusic()
                            gameSelected = .bubbleGum
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
                    }
                    .padding()
                }
                .statusBarHidden()
                .ignoresSafeArea()
                .transition(.slide)
            case .bubbleGum:
                Color.clear.overlay {
                    BubbleGumStatusView(gameSelection: $gameSelected)
                }
                
            case .chagok:
                ChagokGameView(gameSelection: $gameSelected)
                    .transition(.backslide)
            }
        }
        .onAppear {
            MusicPlayer.shared.startBackgroundMusic(musicName: "MainScreenMusicDummy")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MultiPreview {
            HomeView(gameSelected: .constant(.none))
        }
    }
}
