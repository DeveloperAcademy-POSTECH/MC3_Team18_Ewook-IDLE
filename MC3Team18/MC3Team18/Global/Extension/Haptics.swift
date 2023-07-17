//
//  Haptics.swift
//  MC3Team18
//
//  Created by Lee Jinhee on 2023/07/17.
//

import UIKit
///Haptics.tap()

struct Haptics {
    static func tap() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }
    
    static func impact() {
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
    }
    
    static func medium() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }
    
    static func rigid() {
        UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
    }
    
    static func soft() {
        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
    }
    
    static func success() {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }
    
    static func error() {
        UINotificationFeedbackGenerator().notificationOccurred(.error)
    }
    
    static func warining() {
        UINotificationFeedbackGenerator().notificationOccurred(.warning)
    }
}
