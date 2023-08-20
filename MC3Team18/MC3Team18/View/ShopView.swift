//
//  ShopView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/30.
//

import SwiftUI
struct ShopCharacterView: View {
    @EnvironmentObject var shopItemVM: ShopItemViewModel
    let selectedCategory: ItemCategory
    
    var body: some View {
        Image("ShopCharacter").resizable().scaledToFit()
            .frame(width: 325, height: 217, alignment: .bottom)
            .overlay {
                switch selectedCategory {
                case .acc:
                    Image(shopItemVM.selectedAcc?.itemName ?? "")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.2)
                        .offset(x: CGFloat(shopItemVM.selectedAcc?.x ?? 0), y: CGFloat(shopItemVM.selectedAcc?.y ?? 0))
                        .shadow(color: .Black.opacity(0.16), radius: 6, x: 4, y: 4)
                case .bubble:
                    Image(shopItemVM.selectedBubble?.itemName ?? "")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.35)
                        .offset(y: 15)
                        .shadow(color: .Black.opacity(0.16), radius: 6, x: 4, y: 4)
                case .star:
                    Image(shopItemVM.selectedStar?.itemName ?? "")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.26)
                        .offset(x: -80, y: -62)
                        .shadow(color: .Black.opacity(0.16), radius: 6, x: 4, y: 4)
                    Image(shopItemVM.selectedStar?.itemName ?? "")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.22)
                        .offset(x: -44, y: -26)
                        .shadow(color: .Black.opacity(0.16), radius: 6, x: 4, y: 4)
                }
            }
    }
}

struct ShopView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var shopItemVM: ShopItemViewModel
    @State var tappedItem: ShopItem = ShopItem(itemName: "", itemNameKorean: "", price: 0, itemCategory: .acc, itemStatus: 0)
    @State var showPurchasePopup: Bool = false
    @State var buyable: Bool = false
    @State var selectedCategory: ItemCategory = .acc

    var body: some View {
        ZStack{
            Color.CobaltBlue.ignoresSafeArea()
            
            VStack (spacing: 10){
                ShopCharacterView(selectedCategory: selectedCategory)
                ShopItemScrollView(selectedCategory: $selectedCategory, tappedItem: $tappedItem, isPurchasePopupAppear: $showPurchasePopup, buyable: $buyable)
            }
            .padding(.top, 20)
            
            if showPurchasePopup {
                Color.Black.opacity(0.8).ignoresSafeArea()
                    .onTapGesture {
                        showPurchasePopup = false
                    }
                ShopPopupView(showPurchasePopup: $showPurchasePopup, tappedItem: $tappedItem, buyAble: buyable)
            }
        }
        .onBackSwipe {
            presentationMode.wrappedValue.dismiss()
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: btnBack)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("상점")
                    .pretendardSemiBold24()
                    .foregroundColor(.white)
                    .shadow(color: Color("Shadow").opacity(0.5), radius: 8, x: 0, y: 0)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                ShopHeaderView().padding(.trailing, 18)
            }
        }
    }
    
    var btnBack : some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image.backIcon
                .scaledToFit()
                .frame(width: 16, height: 16)
                .pretendardSemiBold20()
                .foregroundColor(.white).padding()
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
