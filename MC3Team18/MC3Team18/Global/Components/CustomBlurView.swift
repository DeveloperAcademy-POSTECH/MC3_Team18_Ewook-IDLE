//
//  CustomBlurView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/14.
//

import SwiftUI

struct CustomBlurView: UIViewRepresentable {
    
    var effect: UIBlurEffect.Style
    var onChange: (UIVisualEffectView) -> ()
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: effect))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        DispatchQueue.main.async {
            onChange(uiView)
        }
    }
}
