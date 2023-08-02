//
//  ShopView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/30.
//

import SwiftUI

struct ShopView: View {
    
    
    var body: some View {
        ZStack{
            Image("BackgroundShopView")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack (spacing: 24){
                ShopHeaderView()
                    .padding(.top, 60)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack (spacing: 40){
                        ShopAccessoriesScrollView()
                        ShopAccessoriesScrollView()
                        ShopAccessoriesScrollView()
                    }
                }
            }
                        

        }

    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
