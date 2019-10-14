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

    var description: NSMutableAttributedString {
        switch self {
        case .draw:
            return NSMutableAttributedString(string: "Draw")
        case .wonBy(let player):
            return player == .X ? "Player X wins".addColorAttribute("X", color: UIColor.BoardColor.crossBlue) : "Player O wins".addColorAttribute("O", color: UIColor.BoardColor.noughtYellow)
        case .turnOff(let player):
            return player == .X ? "Player X's turn".addColorAttribute("X", color: UIColor.BoardColor.crossBlue) : "Player O's turn".addColorAttribute("O", color: UIColor.BoardColor.noughtYellow)
        }
    }

    var isGameOver: Bool {
        switch self {
        case .turnOff:
            return false
        default:
            return true
        }
    }

}
