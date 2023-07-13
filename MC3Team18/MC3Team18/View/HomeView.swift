//
//  HomeView.swift
//  MC3Team18
//
//  Created by 077tech on 2023/07/11.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var gameSelected: GameSelection
    
    var body: some View {
        
        switch gameSelected {
        case .none:
            ZStack{
                Image("BackgroundHomeVIew")
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
            ChagokMainView(gameSelection: $gameSelected)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(gameSelected: .constant(.none))
    }
}
