//
//  StarTutorialView.swift
//  MC3Team18
//
//  Created by Lee Jinhee on 2023/07/23.
//

import SwiftUI

struct StarTutorialView: View {
    @State var isNeverShowingStarTutorialToggle: Bool = false
    
    var body: some View {
        ZStack(){
            Color(.black).opacity(0.75)
            
            VStack(){
                HStack {
                    Spacer()
                    Button {
                        //TODO: 튜토리얼 상태 저장, 게임 상태 시작으로 변경
                    } label: {
                        Image(systemName:  "xmark")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 15, height: 15)
                    }.padding(.all, 4.5)
                }
                
                Spacer().frame(height: 79)
                
                VStack(spacing: 24){
                    Text("은하수 만들기")
                        .pretendardSemiBold32()
                        .foregroundColor(.Yellow)
                        .fontWeight(.bold)
                        .shadow(color: .black.opacity(0.25), radius: 12, x: 1, y: 2)
                    Text("혀를 구르거나 입술을 털어\n은하수를 만들어주세요!")
                        .pretendardSemiBold20()
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .lineSpacing(1)
                        .shadow(color: .black.opacity(0.25), radius: 12, x: 1, y: 2)
                    Text("• 혀굴리기 :  아rrrr\n• 입술털기 :  푸rrrr")
                        .font(.custom("Pretendard", size: 13))
                        .foregroundColor(.white)
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
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct StarTutorialView_Previews: PreviewProvider {
    static var previews: some View {
        StarTutorialView()
    }
}
