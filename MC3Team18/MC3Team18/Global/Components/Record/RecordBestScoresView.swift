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
            VStack {
                ForEach(Array(BestScoreImage.allCases.enumerated()), id: \.element) { index, item in
                    Image("\(item.rawValue)")
                        .resizable()
                        .scaledToFill()
                        .overlay {
                            HStack {
                                Image("\(item.rawValue)"+"Label")
                                    //.resizable().scaledToFill()
                                    .offset(x: index == 1 ? -14 : -2)
                                    .offset(x: index == 2 ? 4 : -2)
                                    .offset(y: index == 2 ? -12 : -2)
                                    .frame(width: 140)
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("\(bestNameArray[index])")
                                        .pretendardBold20()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Spacer()
                                    Text("\(bestScoreArray[index])점")
                                        .pretendardLight16()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                VStack {
                                    Spacer()
                                    HStack(alignment: .bottom, spacing: 2) {
                                        Text("\(bestRecordArray[index])")
                                            .pretendardMedium20()
                                            .offset(y: 2)
                                        Text("\(bestUnitArray[index])")
                                            .pretendardBold14()
                                    }
                                }
                            }
                            .padding(.vertical, 34)
                            .padding(.trailing, 33)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                        }
                }
            }
            .padding(.horizontal, 26)
        }
    }
}

struct RecordBottomScoresView_Previews: PreviewProvider {
    static var previews: some View {
        MultiPreview {
            RecordBestScoresView()
        }
    }
}

extension RecordBestScoresView {
    enum BestScoreImage: String, CaseIterable {
        case bubble = "BubbleBest"
        case chagok = "ChagokBest"
        case banjjak = "BanjjakBest"
    }
}
