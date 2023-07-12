//
//  BubbleGumMainView.swift
//  MC3Team18
//
//  Created by Minkyung Kim on 2023/07/11.
//

import SwiftUI

struct BubbleGumMainView: View {
    @State var isShowingTutorial: Bool = true
    let offsetValue: CGFloat = -740.0
    
    var body: some View {
        
        ZStack(){
            Image("BackgroundBubbleGum")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .offset(y: offsetValue)
            
            VStack(){
                Text(isShowingTutorial ? "" : "소리를 내면 시작합니다")
                    .pretendardSemiBold24()
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.12), radius: 12, x: 1, y: 2)
                Spacer()
                Image("MainCharacter")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 201)
            }
            .padding(.top, -offsetValue + 161 )
            .padding(.bottom, -offsetValue + 276)
            
            
            if isShowingTutorial {
                BubbleGumTutorialView(isShowingTutorial: $isShowingTutorial)
                    .padding(.top, -offsetValue)
                    .padding(.bottom, -offsetValue)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct BubbleGumMainView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleGumMainView()
    }
}
