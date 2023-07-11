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
            ChagokView()
            Color.black.opacity(0.5).ignoresSafeArea()
            VStack {
                Spacer().frame(height: 157)
                Text("Your Score")
                    .padding(.bottom, 40)
                    .fontWeight(.light)
                    .font(.system(size: 32))
                Text("140")
                    .fontWeight(.regular)
                    .font(.system(size: 64))
                    .padding(.bottom, 40)
                HStack {
                    Text("Best Score")
                        .fontWeight(.regular)
                        .font(.system(size: 24))
                    Text("140")
                        .fontWeight(.semibold)
                        .font(.system(size: 24))
                }
                Spacer()
                HStack(spacing: 60) {
                    Button {
                        
                    } label: {
                        Image("GameOverBtn")
                            .overlay {
                                VStack(spacing: 17) {
                                    Image(systemName: "house")
                                    Text("Home")
                                        .fontWeight(.bold)
                                        .font(.system(size: 24))
                                }
                            }
                    }
                    Button {
                        
                    } label: {
                        Image("GameOverBtn")
                            .overlay {
                                VStack(spacing: 17) {
                                    Image(systemName: "arrow.clockwise")
                                    Text("Retry")
                                        .fontWeight(.bold)
                                        .font(.system(size: 24))
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
