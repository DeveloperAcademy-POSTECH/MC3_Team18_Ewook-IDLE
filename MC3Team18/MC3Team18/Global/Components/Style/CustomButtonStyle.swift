//
//  AccentButtonStyle.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/08/01.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    
    @State var gameSelection: GameSelection = .bubble
    
    var AccentTextColor: Color {
        switch gameSelection {
        case .none:
            return Color.AccentButtonText
        case .bubble:
            return Color(red: 0.18, green: 0.32, blue: 0.35)
        case .chagok:
            return Color(red: 0.31, green: 0.35, blue: 0.28)
        case .banjjak:
            return Color(red: 0.10, green: 0.20, blue: 0.27)
        }
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .pretendardBold20()
            .foregroundColor(
                configuration.isPressed ? .white :AccentTextColor
            )
            .background(configuration.isPressed ?
                        Image("ButtonTouched").resizable() :
                            Image("ButtonAccent").resizable()
            )
            .shadow(
                color: configuration.isPressed ?
                Color(red: 0, green: 0, blue: 0, opacity: 0.25) :
                    Color(red: 1, green: 1, blue: 1, opacity: 0.40),
                radius: configuration.isPressed ? 3 : 12.42,
                x: configuration.isPressed ? 0 : 4,
                y: configuration.isPressed ? 0 : 4
            )
    }
}

struct AccentButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button {
            //
        } label: {
            CustomButtonLabel()
        }
        .buttonStyle(CustomButtonStyle(gameSelection: .bubble))
    }
}


