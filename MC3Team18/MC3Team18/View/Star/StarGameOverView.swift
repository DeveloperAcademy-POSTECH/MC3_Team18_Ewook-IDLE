//
//  StarGameOverView.swift
//  MC3Team18
//
//  Created by Lee Jinhee on 2023/07/23.
//

import SwiftUI

struct StarGameOverView: View {
    @State var gameoverOpacity: Double = 0
    @State var starHighScore: Int = 0
    @State var isBestScore: Bool = false
    
    @Binding var starStatus: StarStatus
    
    @Binding var gameSelection: GameSelection
    //TODO: starMissionSucess 데이터 연결
    //@AppStorage("starMissionSuccess") var starMissionSuccess: Bool = false
    
    @EnvironmentObject var starSKScene: StarSKScene
    @Binding var secondsx4: Int
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.75)
            
            VStack {
                HStack {
                    if isBestScore {
                        Spacer()
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
                            .pretendardBold20()
                            .foregroundColor(.Yellow)
                    }
                }
                Spacer()
            }
            .padding(.top, 60)
            .padding(.trailing, 26)
            
            VStack(spacing:209){
                VStack(spacing: 11){
                    if isBestScore {
                        Text("Best Score!")
                            .pretendardBold20()
                            .foregroundColor(.Yellow)
                    } else {
                        Text("Your Score")
                            .pretendardLight32()
                        .foregroundColor(.white)
                    }
                    Text("\(starSKScene.score)")
                        .postNoBillsJaffnaRegular64()
                        .foregroundColor(.white)
                    HStack{
                        Text("Best Score")
                            .pretendardRegular24()
                            .foregroundColor(.LightGray)
                        Text("\(starHighScore)")
                            .pretendardSemiBold24()
                            .foregroundColor(.Yellow)
                    }
                }
                .shadow(color: .black.opacity(0.25), radius: 12, x: 1, y: 2)
                
                HStack(){
                    Button {
                        withAnimation(.easeOut(duration: 0.3)) {
                            
                            starSKScene.isPaused = false
                            starSKScene.removeAllChildren()
                            starStatus = .tutorial
                            secondsx4 = 120
                            starSKScene.score = 0
                            gameSelection = .none
                        }
                    } label: {
                        starGameOverViewButton(systemName: "house", text: "Home")
                    }
                    
                    Spacer()
                    
                    Button {
                        starSKScene.isPaused = false
                        withAnimation(.easeOut(duration: 0.3)) {
                            gameoverOpacity = 0
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            starSKScene.score = 0
                            starStatus = .game
                        }
                        starSKScene.removeAllChildren()
                    } label: {
                        starGameOverViewButton(systemName: "arrow.clockwise", text: "Retry")
                    }
                }.padding(.horizontal, 62)
            }
        }
        .opacity(gameoverOpacity)
        .statusBarHidden()
        .ignoresSafeArea()
        .overlay {
            VStack {
                if isBestScore {
                    LottieView(filename: "CelebLottieAnima")
                        .frame(width: 232, height: 66)
                        .padding(.top, 108)
                }
            }
        }
        .onAppear {
            UIApplication.shared.isIdleTimerDisabled = false
            withAnimation(.easeOut(duration: 0.3)) {
                gameoverOpacity = 1
            }
            
            //TODO: StarMissionSuccess 데이터 연결
            //            if Int(score)! / 1000 >= 5{
            //                StarMissionSuccess = true
            //            }
            starSKScene.isPaused = true
        }
    }
}

//struct StarGameOverView_Previews: PreviewProvider {
//    static var previews: some View {
//        StarGameOverView(starScore: .constant(0), isBestScore: true, starStatus: .constant(.gameover), gameSelection: .constant(.star))
//    }
//}

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
