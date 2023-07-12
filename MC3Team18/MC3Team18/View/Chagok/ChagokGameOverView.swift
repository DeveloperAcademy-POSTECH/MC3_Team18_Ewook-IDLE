//
//  ChagokGameOverView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/11.
//

import SwiftUI

struct ChagokGameOverView: View {
    var body: some View {
        ZStack {
            ChagokView(chagokStatus: .constant(.game))
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
    }
}

struct ChagokGameOverView_Previews: PreviewProvider {
    static var previews: some View {
        ChagokGameOverView()
    }
}
