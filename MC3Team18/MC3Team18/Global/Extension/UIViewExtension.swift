//
//  UIViewExtension.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/14.
//

import UIKit

extension UIView {
    
    func subView(forClass: AnyClass?) -> UIView? {
        return subviews.first { view in
            type(of: view) == forClass
        }
    }
    
}

