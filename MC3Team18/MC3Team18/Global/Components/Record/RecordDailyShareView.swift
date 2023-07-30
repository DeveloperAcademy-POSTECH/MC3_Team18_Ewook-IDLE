//
//  DailyShareView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/23.
//

import SwiftUI

struct RecordDailyShareView: View {
    
    @AppStorage("ChagokMissionSuccess") var ChagokMissionSuccess: Bool = false
    @AppStorage("BubbleMissionSuccess") var bubbleMissionSuccess: Bool = false
    @AppStorage("BanjjakMissionSuccess") var banjjakMissionSuccess: Bool = false
    var completedNum: Int {
        [ChagokMissionSuccess, bubbleMissionSuccess, banjjakMissionSuccess].filter( { (value: Bool) -> Bool in return (value) } ).count
    }
    
    var body: some View {
        ZStack {
            Image("BackgroundDailyShare")
                .resizable()
                .frame(width: 393, height: 393)
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Image(completedNum == 3 ? "CharacterMissionDone" : "CharacterMissionStart")
                        .padding(.trailing, completedNum == 3 ? 0 : 12)
                }
            }
            VStack(alignment: .leading, spacing: 20) {
                Spacer().frame(height: 32)
                HStack {
                    switch completedNum {
                    case 0:
                        Text("오늘의 SounDrill,\n함께 시작해요 👋🏻")
                    case 1...2:
                        Text("오늘의 SounDrill,\n열심히 하는 중 💬")
                    case 3:
                        Text("오늘의 SounDrill,\n완료했어요 🎉")
                    default:
                        Text("오늘의 SounDrill,\n함께 시작해요 👋🏻")
                    }
                    Spacer()
                }
                .lineSpacing(6)
                .pretendardSemiBold24()
                .foregroundColor(.white)
                .frame(height: 68)
                .shadow(color: Color("Shadow").opacity(0.5), radius: 8, x: 0, y: 0)
                HStack(spacing: -16) {
                    RecordHexgagonView(isCompleted: bubbleMissionSuccess, gameName: "버블버블", recordedNumber: 5, unit: "초").scaleEffect(0.8)
                    RecordHexgagonView(isCompleted: ChagokMissionSuccess, gameName: "차곡차곡", recordedNumber: 25, unit: "개").scaleEffect(0.8)
                    RecordHexgagonView(isCompleted: banjjakMissionSuccess, gameName: "반짝반짝", recordedNumber: 10, unit: "개").scaleEffect(0.8)
                    Spacer()
                }.offset(x: -12)
                Spacer()
                VStack(alignment: .leading,spacing: 12) {
                    Text(currentDate)
                        .pretendardBold20().foregroundColor(.CobaltBlue)
                    Image("RecordShareLogo")
                }
                Spacer().frame(height: 35)
            }
            .padding(.all, 30)
            .frame(width: 393, height: 393)
        }
        .frame(width: 393, height: 393)
    }
    
    var currentDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: Date())
    }
}

struct DailyShareView_Previews: PreviewProvider {
    static var previews: some View {
        RecordDailyShareView()
    }
}
