//
//  TrophyView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/22.
//

import SwiftUI

struct TrophyView: View {
    
    @AppStorage("ChagokMissionSuccess") var ChagokMissionSuccess: Bool = false
    @AppStorage("BubbleMissionSuccess") var BubbleMissionSuccess: Bool = false
    @AppStorage("BanjjakMissionSuccess") var BanjjakMissionSuccess: Bool = false
    
    @State var isDailyNotFinished: Bool = false
    @Binding var gameSelected: GameSelection
    
    var body: some View {
        HStack {
            Spacer()
            NavigationLink {
                RecordView(gameSelected: $gameSelected)
            } label: {
                Rectangle()
                    .foregroundColor(.white.opacity(0.9))
                    .frame(width: 124, height: 24)
                    .cornerRadius(12)
                    .overlay {
                        Text("데일리 연습 완성하기!")
                            .pretendardMedium12()
                            .foregroundColor(.Blue)
                    }
                    
            }
            .opacity(isDailyNotFinished ? 1 : 0)
            NavigationLink {
                RecordView(gameSelected: $gameSelected)
            } label: {
                Image(systemName: "trophy")
                    .resizable()
                    .pretendardSemiBold20()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .overlay {
                        VStack {
                            Circle()
                                .foregroundColor(.Orange)
                                .frame(width: 5, height: 5)
                                .offset(x: -12.5)
                            Spacer()
                        }
                        .opacity(isDailyNotFinished ? 1 : 0)
                    }
                    .padding(.trailing, 26)
                    .padding(.top, 2)
            }
        }
        .frame(height: 26)
        .frame(maxWidth: .infinity)
        .onAppear{
            if !ChagokMissionSuccess || !BubbleMissionSuccess || !BanjjakMissionSuccess {
                isDailyNotFinished = true
            }
        }
    }
}

struct TrophyView_Previews: PreviewProvider {
    static var previews: some View {
        TrophyView(gameSelected: .constant(.none))
            .background(.black)
    }
}
