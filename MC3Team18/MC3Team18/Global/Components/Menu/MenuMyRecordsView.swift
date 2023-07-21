//
//  MenuMyRecordsView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/21.
//

import SwiftUI

struct MenuMyRecordsView: View {
    
    @State var backToBackDays: Int = 0
    @State var thisMonthDays: Int = 0
    @State var totalDays: Int = 0
    
    
    var body: some View {
        HStack(spacing: 18) {
            VStack(spacing: 6) {
                Text("연속 연습일")
                    .pretendardMedium12()
                    .foregroundColor(.Gray50)
                    .tracking(-0.5)
                Text("\(backToBackDays)")
                    .pretendardMedium28()
                    .foregroundColor(.CobaltBlue)
            }
            VStack(spacing: 6) {
                Text("이번 달 연습일")
                    .tracking(-0.5)
                    .pretendardMedium12()
                    .foregroundColor(.Gray50)
                Text("\(thisMonthDays)")
                    .pretendardMedium28()
                    .foregroundColor(.CobaltBlue)
            }
            VStack(spacing: 6) {
                Text("누적 연습일")
                    .tracking(-0.5)
                    .pretendardMedium12()
                    .foregroundColor(.Gray50)
                Text("\(totalDays)")
                    .pretendardMedium28()
                    .foregroundColor(.CobaltBlue)
            }
            Image("MainCharacter")
                .resizable()
                .scaledToFit()
                .frame(width: 72)
                .padding(.leading, 21)
        }
        .ignoresSafeArea()
    }
}

struct MenuMyRecordsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuMyRecordsView()
    }
}
