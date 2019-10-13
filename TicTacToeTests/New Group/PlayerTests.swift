//
//  PlayerTests.swift
//  TicTacToeTests
//
//  Created by Ben Algoet on 13/10/2019.
//  Copyright © 2019 2019_DEV_204. All rights reserved.
//

import XCTest
@testable import TicTacToe

class PlayerTests: XCTestCase {

    var currentPlayer: Player!

    override func setUp() {
        super.setUp()
        currentPlayer = .X

    }

    override func tearDown() {
        currentPlayer = nil
        super.tearDown()
    }

    // MARK: - Player tests

    func testCurrentPlayerX() {
        XCTAssertEqual(currentPlayer, Player.X)
    }

    func testPlayerName() {
        XCTAssertEqual(currentPlayer.name, "Cross")
    }

    func testNextPlayer() {
        XCTAssertEqual(currentPlayer.next, Player.O)
        XCTAssertEqual(currentPlayer.next.name, "Nought")
    }

}
