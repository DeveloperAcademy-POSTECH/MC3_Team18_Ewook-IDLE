//
//  BubbleGumPauseView.swift
//  MC3Team18
//
//  Created by Minkyung Kim on 2023/07/11.
//

import SwiftUI

struct BubbleGumPauseView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea()
            
            VStack(){
                Button {
                    
                } label: {
                    VStack(spacing:9){
                        Image(systemName: "play")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 24))
                        Text("Continue")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 24))
                    }
                }
                Spacer()
                Button {
                    
                } label: {
                    VStack(spacing:9){
                        Image(systemName: "house")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 24))
                        Text("Home")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 24))
                    }
                }
                
                Spacer()
                Button {
                    
                } label: {
                    VStack(spacing:9){
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 24))
                        Text("Retry")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 24))
                    }
                }
            }
            .padding(.horizontal, 110)
            .padding(.vertical, 160)
        }
    }
}

struct BubbleGumPauseView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleGumPauseView()
    }
}
