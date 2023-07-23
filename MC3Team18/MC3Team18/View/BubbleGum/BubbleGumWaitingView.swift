//
//  BubbleGumWaitingView.swift
//  MC3Team18
//
//  Created by Lee Jinhee on 2023/07/13.
//

import SwiftUI

struct BubbleGumWaitingView: View {
    @Binding var gameSelection: GameSelection
    @Binding var bubbleGumStatus: BubbleGumStatus
    
    var streamManager: AudioStreamManager
    @ObservedObject var observer: AudioStreamObserver
    
    var body: some View {
        VStack {
            HStack(){
                Image(systemName: "house")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                    .bold()
                Spacer()
            }
            .padding(.top, 67)
            .padding(.leading, 34)
            .padding(.bottom, 70)
            .onTapGesture {
                withAnimation(.easeOut(duration: 0.3)) {
                    gameSelection = .none
                }
            }
            
            Text("소리를 내면 시작합니다")
                .pretendardSemiBold24()
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.12), radius: 12, x: 1, y: 2)
                .onAppear {
                    streamManager.installTap()
                }
                .onChange(of: observer.topResults) { _ in
                    print("Start")
                    //print("\(observer.currentSound)" + "\(observer.topResults[0].confidence)")
                    if observer.currentSound == "Voice" {
                        bubbleGumStatus = .game
                    }
                }
                .onTapGesture {
                    bubbleGumStatus = .game
                }
        }
        .offset(y:-340)
        .ignoresSafeArea(.all)
    }
}

struct BubbleGumWaitingView_Previews: PreviewProvider {
    static var manager = AudioStreamManager()
    static var observer = AudioStreamObserver()
    
    static var previews: some View {
        BubbleGumWaitingView(gameSelection: .constant(.bubbleGum), bubbleGumStatus: .constant(.waiting), streamManager: manager, observer: observer).background(.black.opacity(0.5))
    }
}
