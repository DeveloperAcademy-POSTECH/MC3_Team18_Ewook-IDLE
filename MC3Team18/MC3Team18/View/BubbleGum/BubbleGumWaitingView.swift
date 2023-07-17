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
    
    var streamManager: AudioStreamManager
    @ObservedObject var observer: AudioStreamObserver
    
    var body: some View {
        VStack {
            HStack(){
                Image(systemName: "chevron.left")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 17, height: 22)
                    .foregroundColor(.white)
                Image(systemName: "house")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
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
                .onAppear {
                    streamManager.installTap()
                }
                .onChange(of: observer.currentSound) { _ in
                    print("Start")
                    //print("\(observer.currentSound)" + "\(observer.topResults[0].confidence)")
                    if observer.currentSound == "LipTrill" || observer.currentSound == "TongueTrill" {
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
        BubbleGumWaitingView(gamsSelection: .constant(.bubbleGum), bubbleGumStatus: .constant(.waiting), streamManager: manager, observer: observer).background(.black.opacity(0.5))
    }
}
