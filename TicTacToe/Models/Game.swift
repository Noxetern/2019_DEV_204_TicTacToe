//
//  Game.swift
//  TicTacToe
//
//  Created by Ben Algoet on 13/10/2019.
//  Copyright © 2019 2019_DEV_204. All rights reserved.
//

import UIKit

class Game {

    /*:
     boardValues contains an array of 9 values to keep track of the board's current state
        0 => Empty state
        1 => Filled in by player X
        2 => Filled in by player O
    */
    var boardValues: [Int]
    var currentPlayer: Player
    var gameState: GameState
    let winningLines: [[Int]] = [
        // Horizontal lines
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        // Vertical lines
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        // Diagonal lines
        [0, 4, 8], [2, 4, 6]
    ]

    init() {
        // Default player is X
        currentPlayer = Player.X
        gameState = GameState.turnOff(currentPlayer)
        boardValues = [Int](repeating: 0, count: 9)
    }

    // MARK: - Update board

    func updateBoardValue(index: Int) -> Bool {
        guard boardValues[index] == 0 else { return false }

        boardValues[index] = currentPlayer.rawValue
        return true
    }

    func nextTurn() {
        currentPlayer = currentPlayer.next
        gameState = .turnOff(currentPlayer)
    }

}

