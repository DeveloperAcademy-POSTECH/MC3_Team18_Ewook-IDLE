//
//  CustomButtonLabel.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/08/01.
//

import SwiftUI

struct GameButtonLabel: View {
    
    @State var width: CGFloat = 136
    @State var height: CGFloat = 96
    @State var systemName: String = "arrow.clockwise"
    @State var buttonText: String = "Retry"
    
    var body: some View {
        
        VStack(spacing: 8) {
            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .frame(height: 24)
            Text(buttonText)
        }
        .pretendardBold20()
        .frame(width: width, height: height)
    }
}

struct LightYellowStyleButton_Previews: PreviewProvider {
    static var previews: some View {
        GameButtonLabel()
    }
}
