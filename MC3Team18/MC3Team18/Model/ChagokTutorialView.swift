//
//  ChagokTutorialView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/11.
//

import SwiftUI

struct ChagokTutorialView: View {
    var body: some View {
        ZStack {
            ChagokView()
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "x.circle")
                        .resizable()
                        .frame(width: 36, height: 36)
                }
                .padding(.top, 26)
                .padding(.trailing, 27)
                Text("차곡차곡")
                    .foregroundColor(.yellow)
                    .fontWeight(.semibold)
                    .font(.system(size: 36))
                    .padding(.top, 94)
                    .padding(.bottom, 45)
                Text("컵에 있는 입모양대로\n내 입을 움직여서\n아래에서 부터 차곡차곡 쌓아보세요!")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                Spacer()
                HStack {
                    Image(systemName: "checkmark.square")
                        .resizable()
                        .frame(width: 29, height: 29)
                    Text("다시보지않기")
                        .fontWeight(.regular)
                        .font(.system(size: 20))
                        
                }
                .padding(.bottom, 36)
                
                
            }
            .foregroundColor(.white)
            .ignoresSafeArea()
            
        }
    }
}

struct ChagokTutorialView_Previews: PreviewProvider {
    static var previews: some View {
        ChagokTutorialView()
    }
}
