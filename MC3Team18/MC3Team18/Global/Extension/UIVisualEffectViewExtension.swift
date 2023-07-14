//
//  UIVisualEffectViewExtension.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/14.
//

import UIKit

extension UIVisualEffectView {
    
    var backDrop: UIView? {
        return subView(forClass: NSClassFromString("_UIVisualEffectBackdropView"))
    }
    
    var gaussianBlur: NSObject? {
        return backDrop?.value(key: "filters", filter: "gaussianBlur")
    }
    
    var saturation: NSObject? {
        return backDrop?.value(key: "filters", filter: "colorSaturate")
    }
    
    var gaussianBlurRadius: CGFloat {
        
        get {
            return gaussianBlur?.values?["inputRadius"] as? CGFloat ?? 0
        }
        set {
            gaussianBlur?.values?["inputRadius"] = newValue
            backDrop?.perform(Selector("applyRequestedFilterEffects"))
        }
    }
    
    var saturationAmout: CGFloat {
        
        get {
            return saturation?.values?["inputAmount"] as? CGFloat ?? 0
        }
        set {
            saturation?.values?["inputAmount"] = newValue
        }
    }
    
}
