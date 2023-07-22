//
//  MenuBottomScoresView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/21.
//

import SwiftUI

struct MenuBottomScoresView: View {
    
    //TODO: Star 게임 만들어지면 바꿀 것
    var bestScoreArray : [String] = [ String(UserDefaults.standard.integer(forKey: "chagokScore")), UserDefaults.standard.string(forKey: "BubbleScore")!, "12500"]
    var bestRecordArray : [Int] = [
        UserDefaults.standard.integer(forKey: "chagokScore") / 1500, Int(UserDefaults.standard.string(forKey: "BubbleScore")!)! / 1000, 15
    ]
    var bestUnitArray : [String] = ["줄", "초", "개"]
    var bestNameArray : [String] = ["차곡차곡", "풍선껌불기", "별따먹기"]
    
    
    
    var body: some View {
        VStack {
            HStack {
                Text("Best Scores")
                    .pretendardMedium20()
                Spacer()
            }
            .padding(.leading, 34)
            Spacer().frame(maxHeight: 13)
            HStack(spacing: -3) {
                
                ForEach(Array(BestScoreImage.allCases.enumerated()), id: \.element) { index, item in
                    Image("\(item.rawValue)")
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            HStack {
                                Spacer().frame(maxWidth: 24)
                                VStack(spacing: 0) {
                                    Spacer().frame(maxHeight: 77)
                                    Text("\(bestNameArray[index])")
                                        .pretendardBold14()
                                        .padding(.bottom, 10)
                                        .frame(maxWidth: .infinity, alignment: .leading)

                                    Text("\(bestScoreArray[index])")
                                        .pretendardExtraLight11()
                                        .padding(.bottom, 2)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    HStack(alignment: .bottom, spacing: 2) {
                                        Text("\(bestRecordArray[index])")
                                            .pretendardMedium24()
                                        Text("\(bestUnitArray[index])")
                                            .pretendardSemiBold11()
                                            .offset(y: -4)
                                        Spacer()
                                    }
                                    Spacer().frame(maxHeight: 23)
                                }
                                .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            .foregroundColor(.white)
                        }
                }
            }
            .frame(minHeight: 155)
            .padding(.horizontal, 14)
            
        }
    }
}

struct MenuBottomScoresView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBottomScoresView()
    }
}

extension MenuBottomScoresView {
    enum BestScoreImage: String, CaseIterable {
        case chagok = "ChagokBest"
        case bubble = "BubbleGumBest"
        case star = "StarBest"
    }
}
