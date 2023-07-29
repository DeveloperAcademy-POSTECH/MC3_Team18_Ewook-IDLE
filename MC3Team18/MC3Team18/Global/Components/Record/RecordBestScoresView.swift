//
// RecordBottomScoresView.swift
// MC3Team18
//
// Created by ChoiYujin on 2023/07/21.
//

import SwiftUI

struct RecordBestScoresView: View {
    
    @AppStorage("bubbleScore") var bubbleScore: String = "0"
    @AppStorage("chagokScore") var chagokScore: String = "0"
    @AppStorage("banjjakScore") var banjjakScore: String = "0"
    
    var bestScoreArray : [String] {
        return [bubbleScore, chagokScore, banjjakScore]
    }
    
    var totalBox: String {
        let temp: Int = ((Int(chagokScore) ?? 0) / 1500) * 5
        let temp2: Int = ((Int(chagokScore) ?? 0) % 1500) / 100
        return String(temp + temp2)
    }
    
    var bestRecordArray : [String] {
        return [
            String(format: "%.1f", (Double(bubbleScore) ?? 0.0) / 1000.0),
            totalBox,
            String((Int(banjjakScore) ?? 0) / 300)
        ]
    }
    var bestUnitArray : [String] = ["초", "개", "개"]
    var bestNameArray : [String] = ["버블버블", "차곡차곡", "반짝반짝"]
    var body: some View {
        VStack {
            HStack {
                Text("Best Scores")
                    .pretendardMedium20()
                    .foregroundColor(.DarkGray)
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
                                    Spacer().frame(maxHeight: 90)
                                    Text("\(bestNameArray[index])")
                                        .pretendardBold14()
                                        .padding(.bottom, 10)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text("\(bestScoreArray[index])점")
                                        .pretendardExtraLight12()
                                    //  .padding(.bottom, 2)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    HStack(alignment: .bottom, spacing: 2) {
                                        Text("\(bestRecordArray[index])")
                                            .pretendardMedium24()
                                        Text("\(bestUnitArray[index])")
                                            .pretendardSemiBold12()
                                            .offset(y: -4)
                                        Spacer()
                                    }
                                    Spacer().frame(maxHeight: 16)
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

struct RecordBottomScoresView_Previews: PreviewProvider {
    static var previews: some View {
        RecordBestScoresView()
    }
}

extension RecordBestScoresView {
    enum BestScoreImage: String, CaseIterable {
        case bubble = "BubbleBest"
        case chagok = "ChagokBest"
        case banjjak = "BanjjakBest"
    }
}
