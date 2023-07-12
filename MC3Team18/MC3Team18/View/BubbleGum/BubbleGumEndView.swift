//
//  BubbleGumEndView.swift
//  MC3Team18
//
//  Created by Minkyung Kim on 2023/07/11.
//

import SwiftUI

struct BubbleGumEndView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea()
            
            VStack(spacing:209){
                VStack(spacing: 13){
                    Text("Your Score")
                        .pretendardLight32()
                        .foregroundColor(.white)
                    Text("24")
                        .postNoBillsJaffnaRegular64()
                        .foregroundColor(.white)
                    
                    HStack{
                        Text("Best Score")
                            .pretendardRegular24()
                            .foregroundColor(.LightGray)
                        Text("120")
                            .pretendardSemiBold24()
                            .foregroundColor(.Yellow)
                    }
                }
                
                HStack(){
                    Button {
                        
                    } label: {
                        VStack(spacing: 12){
                            Image(systemName: "house")
                                .foregroundColor(.white)
                                .pretendardBold24()
                            Text("Home")
                                .foregroundColor(.white)
                                .pretendardBold24()
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        VStack(spacing: 12){
                            Image(systemName: "arrow.clockwise")
                                .foregroundColor(.white)
                                .pretendardBold24()
                            Text("Retry")
                                .foregroundColor(.white)
                                .pretendardBold24()
                        }
                    }
                }
                .padding(.horizontal, 62)
            }
        }
    }
}

struct BubbleGumEndView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleGumEndView()
    }
}
