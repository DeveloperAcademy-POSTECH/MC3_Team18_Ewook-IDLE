//
//  HomeView.swift
//  MC3Team18
//
//  Created by 077tech on 2023/07/11.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
                   Button {
                       //풍선껌 불기 View 넣어주시면 됩니다
                       EmptyView()
                   } label: {
                       Text("풍선껌 불기")
                   }
                   .padding(50)
                   .border(Color.red)

                   Button {
                       //차곡차곡 View 넣어주시면 됩니다
                       EmptyView()
                   } label: {
                       Text("차곡차곡")
                   }
                   .padding(50)
                   .border(Color.red)

               }
               .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
