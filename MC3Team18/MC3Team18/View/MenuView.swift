//
//  MenuView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/21.
//

import SwiftUI

struct MenuView: View {
    
    
    
    @Binding var gameSelected: GameSelection
    @AppStorage("chagokMissionSuccess") var chagokMissionSuccess: Bool = false
    @AppStorage("BalloonMissionSuccess") var BalloonMissionSuccess: Bool = false
    @AppStorage("StarMissionSuccess") var StarMissionSuccess: Bool = false
    @AppStorage("DailyRoutineCurrentDate") var DailyRoutineCurrentDate: String = ""
    @State var firstLineText : String = ""
    @State var secondLineText : String = ""
    
    
    var body: some View {
        VStack {
            
            Image("MenuGradient")
                .resizable()
                .frame(minHeight: 250, maxHeight: .infinity)
                .overlay {
                    VStack {
                        Spacer().frame(maxHeight: 55)
                        HStack {
                            Button {
                                withAnimation(.easeOut(duration: 0.3)) {
                                    gameSelected = .none
                                }
                                
                            } label: {
                                Image(systemName: "chevron.left")
                                    .resizable()
                                    .frame(width: 10, height: 18)
                                    .pretendardBold20()
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                            
                            
                            /*
                             message: 메세지 카톡 등을 보낼때 메세지를 같이 보낼 수 있는 메세지 내용
                             subject: 메일 등의 공유일 때 제목에 들어감
                             caption: 공유 창에 뜨는 텍스트
                             */
                            
                            ShareLink(item: photo, subject: Text("subject"), message: Text("message"), preview: SharePreview(
                                photo.caption,
                                image: photo.image)) {
                                    Image(systemName: "square.and.arrow.up")
                                        .resizable()
                                        .frame(width: 18, height: 23)
                                        .pretendardBold20()
                                        .foregroundColor(.white)
                                }
                            
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 37)
                        .frame(height: 24)
                        Spacer().frame(maxHeight: 36)
                        VStack {
                            Text(firstLineText)
                            Text(secondLineText)
                        }
                        .pretendardRegular24()
                        .lineSpacing(10)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        
                        Spacer().frame(maxHeight: 60)
                        HStack(spacing: 19) {
                            MenuHexgagonView(isCompleted: chagokMissionSuccess, gameName: "차곡차곡", recordedNumber: 5, unit: "줄")
                            MenuHexgagonView(isCompleted: BalloonMissionSuccess, gameName: "풍선껌불기", recordedNumber: 5, unit: "초")
                            MenuHexgagonView(isCompleted: StarMissionSuccess, gameName: "별 따먹기", recordedNumber: 10, unit: "개")
                        }
                        Spacer()
                    }
                }
            Spacer().frame(maxHeight: 34)
            HStack {
                Text("My Records")
                    .pretendardMedium20()
                Spacer()
            }
            .padding(.leading, 34)
            
            MenuMyRecordsView(backToBackDays: 5, thisMonthDays: 5, totalDays: 23)
                .padding(.leading, 20)
                .frame(maxWidth: .infinity)
            Spacer().frame(maxHeight: 37)
            Divider()
            Spacer().frame(maxHeight: 19)
            MenuBottomScoresView()
            Spacer().frame(height: 30)
        }
        .ignoresSafeArea()
        .statusBarHidden()
        .background(.white)
        .onAppear{
            if chagokMissionSuccess == true && BalloonMissionSuccess == true && StarMissionSuccess == true{
                firstLineText = "나이스잡! 🎉"
                secondLineText = "데일리 연습을 완료하셨습니다!"
            } else{
                firstLineText = "잘하고 있어요! 👍"
                secondLineText = "전부 완성시켜볼까요?"
            }
        }
    }
    
    var currentDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: Date())
    }
    
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(gameSelected: .constant(.record))
        MultiPreview {
            MenuView(gameSelected: .constant(.record))
        }
    }
}

extension MenuView {
    
    @MainActor
    var photo: TransferableUIImage {
        return .init(uiimage: dailyShareUIImage, caption: "공유해보세요🚀")
    }
    
    @MainActor
    var dailyShareUIImage: UIImage {
        
        let renderer = ImageRenderer(content: DailyShareView())
        renderer.scale = 3.0
        return renderer.uiImage ?? .init()
    }
}
