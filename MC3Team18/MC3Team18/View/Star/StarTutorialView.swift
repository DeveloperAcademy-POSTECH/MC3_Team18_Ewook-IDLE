//
//  StarTutorialView.swift
//  MC3Team18
//
//  Created by Lee Jinhee on 2023/07/23.
//

import SwiftUI

struct StarTutorialView: View {
    @State var isNeverShowingStarTutorialToggle: Bool = false
    @Binding var starStatus: StarStatus
    @State var tutorialOpacity: Double = 1
    @EnvironmentObject var starSKScene: StarSKScene

    var body: some View {
        ZStack(){
            Color(.black).opacity(0.75)
            
            VStack(){
                HStack {
                    Spacer()
                    Button {
                        //TODO: 튜토리얼 상태 저장, 게임 업데이트=false
                        withAnimation(.easeOut(duration: 0.2)) {
                            tutorialOpacity = 0
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            starStatus = .game
                        }
                    } label: {
                        Image(systemName:  "xmark")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }.padding(.all, 4.5)
                }
                
                Spacer().frame(height: 79)
                
                VStack(spacing: 35){
                    Text("반짝반짝")
                        .pretendardSemiBold32()
                        .foregroundColor(.Yellow)
                        .shadow(color: .black.opacity(0.25), radius: 12, x: 1, y: 2)
                    Text("혀를 구르거나 입술을 털면 별이 나와요.\n별이 가득한 밤하늘을 만들어 보세요!")
                        .pretendardSemiBold20()
                        .multilineTextAlignment(.center)
                        .lineSpacing(3)
                        .shadow(color: .black.opacity(0.25), radius: 12, x: 1, y: 2)
                    Text("• 혀굴리기 :  아rrrr\n• 입술털기 :  푸rrrr")
                        .font(.custom("Pretendard", size: 13))
                        .fontWeight(.semibold)
                }
                
                Spacer()
                
                Button {
                    isNeverShowingStarTutorialToggle.toggle()
                } label: {
                    HStack{
                        Image(systemName: isNeverShowingStarTutorialToggle ? "checkmark.square.fill" : "square")
                            .font(.system(size: 20))
                            .pretendardSemiBold20().bold()
                        
                        Text("다시 보지 않기")
                            .pretendardRegular20()
                    }
                }
            }
            .foregroundColor(.white)
            .padding(.top, 48)
            .padding(.bottom, 50)
            .padding(.horizontal, 26)
        }
        .opacity(tutorialOpacity)
        .statusBarHidden()
        .edgesIgnoringSafeArea(.all)
    }
}

//struct StarTutorialView_Previews: PreviewProvider {
//    static var previews: some View {
//        StarTutorialView(starStatus: .constant(.tutorial))
//            .
//    }
//}
