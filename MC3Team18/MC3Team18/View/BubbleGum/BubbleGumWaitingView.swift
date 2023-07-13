//
//  BubbleGumWaitingView.swift
//  MC3Team18
//
//  Created by Lee Jinhee on 2023/07/13.
//

import SwiftUI

struct BubbleGumWaitingView: View {
    @Binding var bubbleGumStatus: BubbleGumStatus

    var body: some View {
        VStack {
            Text("소리를 내면 시작합니다")
                .pretendardSemiBold24()
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.12), radius: 12, x: 1, y: 2)
                .onTapGesture {
                    bubbleGumStatus = .game
                }
        }.padding(.top, -240)
    }
}

struct BubbleGumWaitingView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleGumWaitingView(bubbleGumStatus: .constant(.waiting)).background(.black.opacity(0.5))
    }
}
