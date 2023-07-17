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
        
        VStack{
            switch gameSelected {
            case .none:
                ZStack{
                    Image("BackgroundHomeVIew")
                        .resizable()
                        .scaledToFill()
                    
                    VStack {
                        Button {
                            print("bubble")
                            gameSelected = .bubbleGum
                        } label: {
                            Image("ButtonBalloon")
                        }
                        Button {
                            print("chagok")
                            gameSelected = .chagok
                        } label: {
                            Image("ButtonCupStack")
                        }
                    }
                    .padding()
                }
                .statusBarHidden()
                .ignoresSafeArea()
            case .bubbleGum:
                BubbleGumStatusView(gameSelection: $gameSelected)
            case .chagok:
                ChagokGameView(gameSelection: $gameSelected)
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
