//
//  SplahView.swift
//  MC3Team18
//
//  Created by 077tech on 2023/07/11.
//

import SwiftUI

//Logo가 확정이 안나서 일단 이미지로 대체

struct SplashView: View {
    
    @State var isActive : Bool = false
    @State var gameSelected: GameSelection = .none
    
    var body: some View {
        ZStack{
            if self.isActive{
                HomeView(gameSelected: $gameSelected)
            }else{
                VStack(){
                    Image("BackgroundSplashView").resizable()
                        .overlay(
                            VStack(spacing: 30) {
                                Spacer().frame(height: 14)
                                Image("SplashLogo")
                                    
                                Text("발성연습을 쉽고 재미있게")
                                    .foregroundColor(.white)
                                    .font(.custom("Pretendard-SemiBold", size: 12))
                                    .frame(height: 14)
                                    .kerning(4)
                            }
                        )
                }
                .ignoresSafeArea()
            }
        }
        .statusBarHidden()
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
