//
//  BubbleGumGameOverView.swift
//  MC3Team18
//
//  Created by Minkyung Kim on 2023/07/11.
//

import SwiftUI

struct BubbleGumGameOverView: View {
    @Binding var bubbleGumStatus: BubbleGumStatus
    @Binding var gameSelection: GameSelection
    @Binding var score: String

    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea()
            
            VStack(spacing:209){
                VStack(spacing: 13){
                    Text("Your Score")
                        .pretendardLight32()
                        .foregroundColor(.white)
                    Text(score)
                        .postNoBillsJaffnaRegular64()
                        .foregroundColor(.white)
                    
                    HStack{
                        Text("Best Score")
                            .pretendardRegular24()
                            .foregroundColor(.LightGray)
                        Text("120")
                            .pretendardSemiBold24()
                            .foregroundColor(.Yellow)
                    }
                }
                
                HStack(){
                    Button {
                        gameSelection = .none
                    } label: {
                        VStack(spacing: 12){
                            Image(systemName: "house")
                                .foregroundColor(.white)
                                .pretendardBold24()
                            Text("Home")
                                .foregroundColor(.white)
                                .pretendardBold24()
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        //TODO: 튜토리얼 변수 따라 튜토리얼로 넘어가는 케이스 추가
                        bubbleGumStatus = .waiting
                    } label: {
                        VStack(spacing: 12){
                            Image(systemName: "arrow.clockwise")
                                .foregroundColor(.white)
                                .pretendardBold24()
                            Text("Retry")
                                .foregroundColor(.white)
                                .pretendardBold24()
                        }
                    }
                }.padding(.horizontal, 62)
            }
        }
    }
}

struct BubbleGumGameOverView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleGumGameOverView(bubbleGumStatus: .constant(.gameover), gameSelection: .constant(.bubbleGum), score: .constant("2"))
    }
}
