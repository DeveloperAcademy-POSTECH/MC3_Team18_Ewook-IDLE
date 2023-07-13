//
//  ChagokGameOverView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/11.
//

import SwiftUI

struct ChagokGameOverView: View {
    
    @Binding var gameSelection: GameSelection
    @Binding var chagokStatus: ChagokStatus
    
    var body: some View {
        ZStack {
            
            Color.black.opacity(0.5).ignoresSafeArea()
            VStack(spacing: 13) {
                Spacer().frame(height: 157)
                Text("Your Score")
                    .pretendardLight32()
                Text("140")
                    .postNoBillsJaffnaRegular64()
                HStack {
                    Text("Best Score")
                        .pretendardRegular24()
                        .foregroundColor(.LightGray)
                    Text("140")
                        .pretendardSemiBold24()
                        .foregroundColor(.Yellow)
                }
                Spacer()
                HStack(spacing: 60) {
                    Button {
                        gameSelection = .none
                    } label: {
                        Image("ButtonGameOver")
                            .overlay {
                                VStack(spacing: 9) {
                                    Image(systemName: "house")
                                        .resizable()
                                        .pretendardSemiBold20()
                                        .frame(width: 29, height: 25)
                                    Text("Home")
                                        .pretendardBold24()
                                }
                            }
                    }
                    Button {
                        chagokStatus = .game
                    } label: {
                        Image("ButtonGameOver")
                            .overlay {
                                VStack(spacing: 9) {
                                    Image(systemName: "arrow.clockwise")
                                        .resizable()
                                        .pretendardSemiBold20()
                                        .frame(width: 21, height: 26)
                                    Text("Retry")
                                        .pretendardBold24()
                                }
                            }
                    }
                }
                .padding(.bottom, 160)
            }
            .ignoresSafeArea()
            .foregroundColor(.white)
        }
        .statusBarHidden()
    }
}

struct ChagokGameOverView_Previews: PreviewProvider {
    static var previews: some View {
        ChagokGameOverView(gameSelection: .constant(.chagok), chagokStatus: .constant(.gameover))
    }
}
