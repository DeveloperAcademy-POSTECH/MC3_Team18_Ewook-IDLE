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
    
    var body: some View {
        ZStack{
            if self.isActive{
                HomeView()
            }else{
                VStack(){
                    Image("BackgroundSplashView")
                        .overlay(
                        Image("SplashLogo")
                        )
                }
                .ignoresSafeArea()
            }
            
        }
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
