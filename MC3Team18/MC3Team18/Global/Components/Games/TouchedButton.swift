//
//  TouchedButton.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/08/01.
//

import SwiftUI

struct TouchedButton: View {
    var body: some View {
        ZStack {
            
            VStack(spacing: 8) {
                Image(systemName: "arrow.clockwise")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 24)
                Text("Retry")
            }
            .pretendardBold20()
            .foregroundColor(.white)
        }
        .frame(width: 167, height: 134)
        .background(Color(red: 1, green: 0.66, blue: 0))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .inset(by: 1.50)
                .stroke(
                    Color(red: 0.99, green: 1, blue: 0.42).opacity(0.60), lineWidth: 1.50
                )
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .inset(by: 1.50)
                .stroke(
                    Color(red: 1, green: 1, blue: 1).opacity(0.20), lineWidth: 1.50
                )
        )
        .shadow(
            color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4
        );
    }
}

struct TouchedButton_Previews: PreviewProvider {
    static var previews: some View {
        TouchedButton()
    }
}
