//
//  BubbleTutorialView.swift
//  MC3Team18
//
//  Created by Minkyung Kim on 2023/07/11.
//

import SwiftUI

struct BubbleTutorialView: View {
    
    @Binding var bubbleStatus: BubbleStatus
    @Binding var isShowingBubbleTutorial: Bool
    @Binding var isNeverShowingBubbleTutorial: Bool
    @State var isNeverShowingBubbleTutorialToggle : Bool = false
    
    var body: some View {
        
        ZStack(){
            Color(.black).opacity(0.85)
            
            VStack(){
                HStack {
                    Spacer()
                    Button {
                        isShowingBubbleTutorial = false
                        isNeverShowingBubbleTutorialToggle = isNeverShowingBubbleTutorial
                        bubbleStatus = .waiting
                    } label: {
                        Image(systemName:  "xmark")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 15, height: 15)
                    }.padding(.all, 4.5)
                }
                
                Spacer().frame(height: 12)
                
                VStack(spacing: 24){
                    Text("버블버블")
                        .pretendardSemiBold32()
                        .foregroundColor(.Yellow)
                        .shadow(color: .black.opacity(0.25), radius: 12, x: 1, y: 2)
                    Text("목소리를 최대한 오래 내보세요\n풍선껌이 점점 커집니다!")
                        .pretendardSemiBold20()
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .lineSpacing(1)
                        .shadow(color: .black.opacity(0.25), radius: 12, x: 1, y: 2)
                }
                LottieView(filename: "lottieAnima_bubble")
                    .scaledToFit()
                    .frame(width: 325, height: 520)
                    .padding(.top, 11)
                    .scaleEffect(1.4)
                Spacer()
                Button {
                    isNeverShowingBubbleTutorialToggle.toggle()
                    print("\(isNeverShowingBubbleTutorialToggle.description)")
                   
                    
                } label: {
                    HStack{
                        Image(systemName: isNeverShowingBubbleTutorialToggle ? "checkmark.square.fill" : "square")
                            .font(.system(size: 20))
                            .pretendardSemiBold20().bold()
                            .foregroundColor(.white)
                        
                        Text("다시 보지 않기")
                            .pretendardRegular20()
                        .foregroundColor(.white)
                        
                    }
                }
            }
            .padding(.top, 60)
            .padding(.bottom, 50)
            .padding(.horizontal, 34)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct BubbleTutorialView_Previews: PreviewProvider {
    static var previews: some View {
        MultiPreview {
            BubbleTutorialView(bubbleStatus: .constant(.tutorial), isShowingBubbleTutorial: .constant(true), isNeverShowingBubbleTutorial: .constant(false), isNeverShowingBubbleTutorialToggle: false)
        }
    }
}
