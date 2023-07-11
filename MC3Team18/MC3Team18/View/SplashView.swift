//
//  SplahView.swift
//  MC3Team18
//
//  Created by 077tech on 2023/07/11.
//

import SwiftUI

//Logo가 확정이 안나서 일단 이미지로 대체

struct SplashView: View {
    var body: some View {
        VStack(){
            Image("SplashViewBackground")
                .overlay(
                Image("SplashLogoImage")
                )
        }
        .ignoresSafeArea()
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
