//
//  ChagokView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/11.
//

import SwiftUI

struct ChagokView: View {
    var body: some View {
        ZStack {
            Color.clear.overlay {
                Image("ChagokBackground")
                    .resizable()
                    .scaledToFill()
            }
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("Score: ")
                        .pretendardRegular20()
                        .frame(height: 29)
                    Text("0")
                        .pretendardSemiBold24()
                        .foregroundColor(.yellow)
                    Spacer()
                    Image(systemName: "pause.circle")
                        .resizable()
                        .pretendardSemiBold20()
                        .frame(width: 29, height: 29)
                    
                }
                .foregroundColor(.white)
                .padding(.bottom, 5)
                .frame(height: 29)
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
                            HStack {
                                Capsule()
                                    .frame(height: 10)
                                    .frame(width: 30)
                                    .foregroundColor(.white.opacity(0.9))
                                    .padding(5)
                                Spacer()
                            }
                        }
                }
                .frame(height: 31)
                .padding(.bottom, 17)
                HStack {
                    Rectangle().frame(width: 155, height: 360).cornerRadius(12)
                    Rectangle().frame(width: 155, height: 360).cornerRadius(12)
                }
                .foregroundColor(.white.opacity(0.4))
                Spacer()
            }
            .padding(.top, 50)
            .padding(.horizontal, 32)
            
            VStack {
                Spacer()
                Color.white.frame(height: 367)
                    .offset(y: 30)
            }
        }
        .ignoresSafeArea()
    }
}

struct ChagokView_Previews: PreviewProvider {
    static var previews: some View {
        ChagokView()
    }
}
