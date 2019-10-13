//
//  GameState.swift
//  TicTacToe
//
//  Created by Ben Algoet on 13/10/2019.
//  Copyright © 2019 2019_DEV_204. All rights reserved.
//

import UIKit

enum GameState: Equatable {
    case draw
    case wonBy(_ player: Player)
    case turnOff(_ player: Player)
    
    var description: String {
        switch self {
        case .draw:
            return "Draw"
        case .wonBy(let player):
            return player == Player.X ? "Player X win" : "Player O win"
        case .turnOff(let player):
            return player == Player.X ? "Player X turn" : "Player O turn"
        }
    }
    
    var isGameOver: Bool {
        switch self {
        case .turnOff(_):
            return false
        default:
            return true
        }
    }
}
