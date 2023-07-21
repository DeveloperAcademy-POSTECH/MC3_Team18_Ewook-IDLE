//
//  MenuBottomScoresView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/21.
//

import SwiftUI

struct MenuBottomScoresView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Best Scores")
                    .pretendardMedium20()
                Spacer()
            }
            .padding(.leading, 34)
            Spacer().frame(maxHeight: 13)
            HStack {
                Color.CobaltBlue.frame(width: 97, height: 156)
                Color.CobaltBlue.frame(width: 97, height: 156)
                Color.CobaltBlue.frame(width: 97, height: 156)
            }
        }
    }
}

struct MenuBottomScoresView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBottomScoresView()
    }
}
