//
//  BubbleGumTutorialView.swift
//  MC3Team18
//
//  Created by Minkyung Kim on 2023/07/11.
//

import SwiftUI

struct BubbleGumTutorialView: View {
    
    @Binding var bubbleGumStatus: BubbleGumStatus
    @Binding var isShowingBubbleGumTutorial: Bool
    @Binding var isNeverShowingBubbleGumTutorial: Bool 
    @State var isNeverShowingBubbleGumTutorialToggle : Bool = false
    
    var body: some View {
        
        ZStack(){
            Color(.black).opacity(0.75)
            
            VStack(){
                HStack {
                    Spacer()
                    Button {
                        UserDefaults.standard.set(false, forKey: "isShowingBubbleGumTutorial")
                        UserDefaults.standard.set(isNeverShowingBubbleGumTutorialToggle, forKey: "isNeverShowingBubbleGumTutorial")
                        bubbleGumStatus = .waiting


                    } label: {
                        Image(systemName:  "xmark")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 15, height: 15)
                    }.padding(.all, 4.5)
                }
                
                Spacer().frame(height: 50)
                
                VStack(spacing: 24){
                    Text("버블버블")
                        .pretendardSemiBold32()
                        .foregroundColor(.Yellow)
                        .fontWeight(.bold)
                        .shadow(color: .black.opacity(0.25), radius: 12, x: 1, y: 2)
                    Text("목소리를 최대한 오래 내보세요\n풍선껌이 점점 커집니다!")
                        .pretendardSemiBold20()
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .lineSpacing(1)
                        .shadow(color: .black.opacity(0.25), radius: 12, x: 1, y: 2)
                    LottieView(filename: "lottieAnima_bubble")
                        .scaledToFit()
                        .frame(width: 325, height: 520)
                        .padding(.top, 11)
                        .scaleEffect(1.4)
                }
                Spacer()
                Button {
                    isNeverShowingBubbleGumTutorialToggle.toggle()
                    print("\(isNeverShowingBubbleGumTutorialToggle.description)")
                   
                    
                } label: {
                    HStack{
                        Image(systemName: isNeverShowingBubbleGumTutorialToggle ? "checkmark.square.fill" : "square")
                            .font(.system(size: 20))
                            .pretendardSemiBold20().bold()
                            .foregroundColor(.white)
                        
                        Text("다시 보지 않기")
                            .pretendardRegular20()
                        .foregroundColor(.white)
                        
                    }
                }
            }
            .padding(.top, 48)
            .padding(.bottom, 50)
            .padding(.horizontal, 26)
        }.edgesIgnoringSafeArea(.all)
//            .onAppear{
//                if UserDefaults.standard.bool(forKey: "isNeverShowingBubbleGumTutorial") == true {
//                    bubbleGumStatus = .waiting
//                }
//                else {
//                    bubbleGumStatus = .tutorial
//                }
//            }
    }
}

struct BubbleGumTutorialView_Previews: PreviewProvider {
    static var previews: some View {
        MultiPreview {
            BubbleGumTutorialView(bubbleGumStatus: .constant(.tutorial), isShowingBubbleGumTutorial: .constant(true), isNeverShowingBubbleGumTutorial: .constant(false), isNeverShowingBubbleGumTutorialToggle: false)
        }
    }
}
