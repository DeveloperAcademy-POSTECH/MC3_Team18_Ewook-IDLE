//
//  MenuHexgagonView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/21.
//

import SwiftUI

struct MenuHexgagonView: View {
    
    @State var isCompleted: Bool = true
    @State var gameName = "차곡차곡"
    @State var recordedNumber = 5
    @State var unit = "줄"
    
    
    
    var body: some View {
        Image("MenuHexagon")
            .frame(width: 100, height: 100)
            .overlay {
                ZStack {
                    VStack(spacing: 4) {
                        Text("\(gameName)")
                            .pretendardMedium12()
                            .foregroundColor(.Gray50)
                        HStack(alignment: .bottom, spacing: 2) {
                            Text("\(recordedNumber)")
                                .pretendardMedium28()
                                .foregroundColor(.CobaltBlue)
                            Text(unit)
                                .pretendardRegular11()
                                .foregroundColor(.CobaltBlue)
                                .padding(.bottom, 6)
                        }
                    }
                    
                    if isCompleted {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Image(systemName: "checkmark.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding(.bottom, 3)
                                    .padding(.trailing, 5)
                                    .foregroundColor(.CobaltBlue)
                            }
                        }
                    }
                    
                    
                }
            }
    }
}

struct MenuHexgagonView_Previews: PreviewProvider {
    static var previews: some View {
        MenuHexgagonView()
    }
}
