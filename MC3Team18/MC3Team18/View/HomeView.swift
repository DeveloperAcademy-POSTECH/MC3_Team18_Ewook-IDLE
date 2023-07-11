//
//  HomeView.swift
//  MC3Team18
//
//  Created by 077tech on 2023/07/11.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Image("SplashViewBackground")
            VStack {
                Image("BalloonButtonImage")
                    .onTapGesture {
                        EmptyView()
                        print("BalloonButtonImage Clicked")
                    }
                Image("CupStackButtonImage")
                    .onTapGesture {
                        EmptyView()
                        print("CupStackButtonImage Clicked")
                    }
                   }
                   .padding()
        }
        .ignoresSafeArea()

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
