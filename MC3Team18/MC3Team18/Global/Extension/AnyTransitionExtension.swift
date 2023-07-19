//
//  AnyTransitionExtension.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/18.
//

import SwiftUI

extension AnyTransition {
    static var backslide: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading))}
}
