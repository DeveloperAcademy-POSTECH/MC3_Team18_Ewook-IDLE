//
//  ShopAccessoriesScrollView.swift
//  MC3Team18
//
//  Created by jisukwon on 2023/08/01.
//

import SwiftUI

struct ShopAccessoriesScrollView: View {
    
    let accessoriesItemArray : [String] = ["sunglasses", "flower", "cap"]
    var items: [ShopItem] = []
    
    var body: some View {
        VStack(spacing: 16){
            HStack{
                Image("AccessoriesTitle")
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(0..<3) { i in
                        AccessoriesItemBoxView(itemImage: "\(accessoriesItemArray[i])")
                    }
                }
            }
        }
        .padding(.leading, 26)
        
    }
}
struct AccessoriesItemBoxView: View {
    @State var itemImage: String
    var itemInUse : Bool = false
    var itemSold : Bool = true
    
    var body: some View {
        VStack(spacing: 8){
            ZStack {
                Image("itemBox")
                    .resizable()
                    .frame(width: 157, height: 162)
//                Rectangle()
//                    .fill(Color.white)
//                    .frame(width: 157, height: 162)
//                    .cornerRadius(12)
                    .shadow(color: Color("Shadow").opacity(0.12), radius: 8, x: 4, y: 4)
                Image("\(itemImage)")

                Image("itemLabelSold")
                    .resizable()
                    .frame(width: 157, height: 162)
                    .opacity(itemInUse ? 0 : 1)
                Image("itemLabelInUse")
                    .resizable()
                    .frame(width: 157, height: 162)
                    .opacity(itemSold ? 0 : 1)
            }
            HStack {
                HStack(spacing: 4){
                    Image("IconShop")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("500")
                        .font(.custom("PostNoBillsJaffna-ExtraBold", size: 24))
                        .foregroundColor(.Yellow)
                }
                Spacer()
                Image("buttonBuy")
            }
        }
            
    }
}

struct ShopAccessoriesScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ShopAccessoriesScrollView()
            .background(.blue)
    }
}
