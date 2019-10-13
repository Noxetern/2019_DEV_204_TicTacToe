//
//  GameStateTests.swift
//  TicTacToeTests
//
//  Created by Ben Algoet on 13/10/2019.
//  Copyright © 2019 2019_DEV_204. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameStateTests: XCTestCase {

    var state: GameState!
    var currentPlayer: Player!

    override func setUp() {
        super.setUp()
        currentPlayer = .X
        state = .turnOff(currentPlayer)

    }

    override func tearDown() {
        state = nil
        super.tearDown()
    }

    // MARK: - Player tests

    func testCurrentGameState() {
        XCTAssertEqual(state, GameState.turnOff(Player.X))
    }

    func testStateDescription() {
        XCTAssertEqual(state.description, "Player X turn")
    }

    func testIsGameOver() {
        state = .wonBy(Player.O)

        XCTAssertTrue(state.isGameOver)
    }

}
