//
//  StarGameOverView.swift
//  MC3Team18
//
//  Created by Lee Jinhee on 2023/07/23.
//

import SwiftUI

struct StarGameOverView: View {
    @Binding var starScore: Int
    @Binding var bubbleHighScore: String
    @State var gameoverOpacity: Double = 0
    @Binding var isBestScore: Bool
    
    //@Binding var gameSelection: GameSelection
    //@Binding var starStatus: StarStatus
    //TODO: starMissionSucess 데이터 연결
    //@AppStorage("starMissionSuccess") var starMissionSuccess: Bool = false
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.75).ignoresSafeArea()
            
            VStack(spacing:209){
                VStack(spacing: 13){
                    if isBestScore {
                        Text("Best Score!")
                            .pretendardBold20()
                            .foregroundColor(.Yellow)
                    }
                    Text("Your Score")
                        .pretendardLight32()
                        .foregroundColor(.white)
                    Text("\(starScore)")
                        .postNoBillsJaffnaRegular64()
                        .foregroundColor(.white)
                    HStack{
                        Text("Best Score")
                            .pretendardRegular24()
                            .foregroundColor(.LightGray)
                        Text(bubbleHighScore)
                            .pretendardSemiBold24()
                            .foregroundColor(.Yellow)
                    }
                }
                .shadow(color: .black.opacity(0.25), radius: 12, x: 1, y: 2)
                
                HStack(){
                    Button {
                        withAnimation(.easeOut(duration: 0.3)) {
                            // TODO: 화면 이동 gameSelection = .none
                        }
                    } label: {
                        starGameOverViewButton(systemName: "house", text: "Home")
                    }
                    
                    Spacer()
                    
                    Button {
                        //TODO: 게임 상태 초기화면으로 변경(home?)
                    } label: {
                        starGameOverViewButton(systemName: "arrow.clockwise", text: "Retry")
                    }
                }.padding(.horizontal, 62)
            }
        }
        .overlay {
            VStack {
                if isBestScore {
                    LottieView(filename: "CelebLottieAnima")
                        .frame(width: 232, height: 66)
                        .offset(y: -310)
                }
            }
        }
        .onAppear {
            UIApplication.shared.isIdleTimerDisabled = false
            //TODO: StarMissionSuccess 데이터 연결
            //            if Int(score)! / 1000 >= 5{
            //                StarMissionSuccess = true
            //            }
        }
    }
}

struct StarGameOverView_Previews: PreviewProvider {
    static var previews: some View {
        StarGameOverView(starScore: .constant(0), bubbleHighScore: .constant("3000"), isBestScore: .constant(true))
    }
}

extension StarGameOverView {
    func starGameOverViewButton(systemName: String, text: String) -> some View {
        return GlassMorphicCard()
            .overlay {
                Image("ButtonGameOverBorder")
                VStack(spacing:9){
                    Image(systemName: systemName)
                        .foregroundColor(.white)
                        .pretendardSemiBold20()
                        .frame(height: 25).scaledToFit()
                        .bold()
                    Text(text)
                        .foregroundColor(.white)
                        .pretendardBold24()
                }
            }
    }
    
    @ViewBuilder
    func GlassMorphicCard() -> some View {
        ZStack {
            CustomBlurView(effect: .systemUltraThinMaterialLight) { view in
                view.gaussianBlurRadius = 4.5
            }
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        }
        .frame(width: 104, height: 137)
        .shadow(
            color: Color(.white).opacity(0.4), radius: 16
        )
    }
}
