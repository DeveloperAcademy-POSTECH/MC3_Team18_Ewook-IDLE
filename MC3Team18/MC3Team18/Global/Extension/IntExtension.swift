//
//  IntExtension.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/08/06.
//

import Foundation

extension Int {
    func addComma() -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(for: self)!
    }
}
