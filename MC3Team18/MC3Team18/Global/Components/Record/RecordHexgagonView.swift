//
//  RecordHexgagonView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/21.
//

import SwiftUI

struct RecordHexgagonView: View {
    
    @State var isCompleted: Bool = true
    var gameName = "차곡차곡"
    var recordedNumber = 5
    var unit = "개"
    
    var body: some View {
        Image(isCompleted ? "RecordHexagonCheck":"RecordHexagonUncheck")
            .resizable()
            .frame(width: 110, height: 110)
            .overlay {
                ZStack {
                    VStack {
                        Spacer().frame(height: 32)
                        Text("\(gameName)")
                            .pretendardSemiBold16()
                        HStack(alignment: .bottom, spacing: 2) {
                            Text("\(recordedNumber)")
                                .pretendardMedium28()
                            Text(unit)
                                .pretendardRegular12().offset(y: -4)
                        }
                        Spacer().frame(height: 27)
                    }
                }
                .foregroundColor(isCompleted ? .CobaltBlue : .Gray50)
            }
    }
}

struct RecordHexgagonView_Previews: PreviewProvider {
    static var previews: some View {
        RecordHexgagonView().background(Color.black.opacity(0.7))
    }
}
