//
//  BubbleGumWaitingView.swift
//  MC3Team18
//
//  Created by Lee Jinhee on 2023/07/13.
//

import SwiftUI

struct BubbleGumWaitingView: View {
    @Binding var gamsSelection: GameSelection
    @Binding var bubbleGumStatus: BubbleGumStatus
    
    var body: some View {
        VStack {
            HStack(){
                Image(systemName: "chevron.left")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 24)
                    .foregroundColor(.white)
                Image(systemName: "house")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.top, 45)
            .padding(.leading, 14)
            .padding(.bottom, 92)
            
            .onTapGesture {
                gamsSelection = .none
            }
            Text("소리를 내면 시작합니다")
                .pretendardSemiBold24()
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.12), radius: 12, x: 1, y: 2)
                .onTapGesture {
                    bubbleGumStatus = .game
                }
            // Spacer()
        }
        .offset(y:-340)
        .ignoresSafeArea(.all)
    }
}

struct BubbleGumWaitingView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleGumWaitingView(gamsSelection: .constant(.bubbleGum), bubbleGumStatus: .constant(.waiting)).background(.black.opacity(0.5))
    }
}
