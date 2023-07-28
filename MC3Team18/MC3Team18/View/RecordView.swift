//
//  RecordView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/21.
//

import SwiftUI

struct RecordView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var gameSelected: GameSelection
    @AppStorage("ChagokMissionSuccess") var ChagokMissionSuccess: Bool = false
    @AppStorage("BubbleMissionSuccess") var BubbleMissionSuccess: Bool = false
    @AppStorage("BanjjakMissionSuccess") var BanjjakMissionSuccess: Bool = false
    @AppStorage("DailyRoutineCurrentDate") var DailyRoutineCurrentDate: String = ""
    @State var firstLineText : String = ""
    @State var secondLineText : String = ""
    
    
    var body: some View {
        VStack {
            
            Image("RecordGradient")
                .resizable()
                .frame(minHeight: 250, maxHeight: .infinity)
                .overlay {
                    VStack {
                        Spacer().frame(maxHeight: 55)
                        HStack {
                            Spacer()
                            
                            /*
                             message: 메세지 카톡 등을 보낼때 메세지를 같이 보낼 수 있는 메세지 내용
                             subject: 메일 등의 공유일 때 제목에 들어감
                             caption: 공유 창에 뜨는 텍스트
                             */
                            
                            ShareLink(item: photo, subject: Text(""), message: Text(""), preview: SharePreview(
                                photo.caption,
                                image: photo.image)) {
                                    Image(systemName: "square.and.arrow.up")
                                        .resizable().scaledToFit()
                                        .frame(width: 18, height: 22)
                                        .pretendardSemiBold20()
                                        .foregroundColor(.white)
                                }
                            
                        }
                        .padding(.trailing, 37)
                        .frame(height: 24)
                        Spacer().frame(maxHeight: 36)
                        VStack(spacing:10) {
                            Text(firstLineText)
                            Text(secondLineText)
                        }
                        .pretendardSemiBold24()
                        .shadow(color: Color("Shadow").opacity(0.5), radius: 8, x: 0, y: 0)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        
                        Spacer().frame(maxHeight: 60)
                        HStack(spacing: 19) {
                            RecordHexgagonView(isCompleted: BubbleMissionSuccess, gameName: "버블버블", recordedNumber: 5, unit: "초")
                            RecordHexgagonView(isCompleted: ChagokMissionSuccess, gameName: "차곡차곡", recordedNumber: 5, unit: "줄")
                            RecordHexgagonView(isCompleted: BanjjakMissionSuccess, gameName: "반짝반짝", recordedNumber: 10, unit: "개")
                        }
                        Spacer()
                    }
                }
            Spacer().frame(maxHeight: 34)
            Divider()
            Spacer().frame(height: 31)
            RecordBestScoresView()
            Spacer().frame(height: 60)
        }
        .onBackSwipe {
            presentationMode.wrappedValue.dismiss()
        }
        .ignoresSafeArea()
        .statusBarHidden()
        .background(.white)
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: btnBack)
        .onAppear{
            if ChagokMissionSuccess == true && BubbleMissionSuccess == true && BanjjakMissionSuccess == true{
                firstLineText = "훌륭합니다! 🎉"
                secondLineText = "오늘의 드릴을 완료했어요!"
            } else if ChagokMissionSuccess == true || BubbleMissionSuccess == true || BanjjakMissionSuccess == true{
                firstLineText = "잘하고 있어요! 👍"
                secondLineText = "전부 완료해 볼까요?"
            }
            else {
                firstLineText = " 안녕하세요 😊"
                secondLineText = "오늘의 SounDrill, 시작해볼까요?"
            }
        }
    }
    
    var currentDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: Date())
    }
    
    var btnBack : some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .pretendardSemiBold20()
                    .foregroundColor(.white).padding()
            }
        }
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView(gameSelected: .constant(.none))
        MultiPreview {
            RecordView(gameSelected: .constant(.none))
        }
    }
}

extension RecordView {
    
    @MainActor
    var photo: TransferableUIImage {
        return .init(uiimage: dailyShareUIImage, caption: "공유해보세요🚀")
    }
    
    @MainActor
    var dailyShareUIImage: UIImage {
        
        let renderer = ImageRenderer(content: RecordDailyShareView())
        renderer.scale = 3.0
        return renderer.uiImage ?? .init()
    }
}
