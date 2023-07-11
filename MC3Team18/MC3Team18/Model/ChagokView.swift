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
                HStack {
                    Text("Score: 0")
                        .font(.system(size: 20))
                        .frame(height: 29)
                    Spacer()
                    Image(systemName: "pause.circle")
                        .resizable()
                        .frame(width: 29, height: 29)
                    
                }
                .foregroundColor(.white)
                .padding(.bottom, 5)
                .frame(height: 29)
                HStack(spacing: 4) {
                    Image(systemName: "hourglass")
                        .resizable()
                        .frame(width: 22, height: 31)
                        .scaledToFit()
                        .foregroundColor(.white)
                    Spacer()
                    Capsule()
                        .frame(height: 16)
                        .foregroundColor(.gray).opacity(0.4)
                        .overlay {
                            HStack {
                                Capsule()
                                    .frame(height: 10)
                                    .frame(width: 30)
                                    .foregroundColor(.gray)
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
                .foregroundColor(.gray.opacity(0.4))
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
