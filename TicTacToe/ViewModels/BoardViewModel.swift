//
//  BoardViewModel.swift
//  TicTacToe
//
//  Created by Ben Algoet on 13/10/2019.
//  Copyright © 2019 2019_DEV_204. All rights reserved.
//

import UIKit

class BoardViewModel {
    
    private var game: Game
    var isFinished: Bool

    // MARK: - Init
    
    init(game: Game) {
        self.game = game
        isFinished = false
    }
    
    // MARK: - Public properties
    
    var playAgainText: String {
        return "Play again"
    }
    
    var showResetButton: Bool {
        return game.gameState.isGameOver
    }
    
    var gameStateText: String {
        return game.gameState.description
    }
    
    // MARK: - Update board
    
    func updateBoardAt(_ square: SquareButtonView, completion: @escaping (Bool) -> Void) {
        let index = square.tag - 1
        
        guard game.updateBoardValue(index: index) && square.status.isEmpty else { return }
        
        square.status = .OccupiedBy(game.currentPlayer)
        
        if game.checkForWinner() != nil {
            isFinished = true
        } else if game.checkForDraw() {
            isFinished = true
        } else {
            game.nextTurn()
            isFinished = false
        }
        
        completion(isFinished)
    }
    
    // MARK: - Reset board
    
    func resetBoard() {
        game.resetBoardState()
        isFinished = false
    }
    

}
