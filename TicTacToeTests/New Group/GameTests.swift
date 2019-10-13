//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Ben Algoet on 13/10/2019.
//  Copyright © 2019 2019_DEV_204. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    var game: Game!

    override func setUp() {
        super.setUp()
        game = Game()
    }

    override func tearDown() {
        game = nil
        super.tearDown()
    }

    // MARK: - Initialising game
    
    func testActivePlayerX() {
        XCTAssertEqual(game.currentPlayer, Player.X)
    }
    
    func testInitialGameState() {
        XCTAssertEqual(game.gameState, GameState.turnOff(Player.X))
    }
    
    func testInitialBoardValues() {
        XCTAssertEqual(game.boardValues, [Int](repeating: 0, count: 9))
    }
    
    // MARK: - Update board
    
    func testUpdatedBoardValues() {
        // Given square with index 5 was tapped
        let squareIndex = 5
        
        // When
        let isUpdated = game.updateBoardValue(index: squareIndex)
        
        // Then
        XCTAssertTrue(isUpdated)
        XCTAssertEqual(game.boardValues[5], Player.X.rawValue)
    }
    
    func testNextTurn() {
        // When
        game.nextTurn()
        
        // Then
        XCTAssertEqual(game.currentPlayer, Player.O)
        XCTAssertEqual(game.gameState, GameState.turnOff(Player.O))
    }
    
}

