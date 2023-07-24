//
//  StarGameData.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/24.
//

import Foundation

class StarGameData: ObservableObject {
    
    @Published var secondx4: Int = 120
    @Published var score: Int = 0
    @Published var gameStatus: StarStatus = .tutorial
    
    func resetGame() {
        secondx4 = 120
        score = 0
        gameStatus = .game
    }
}
