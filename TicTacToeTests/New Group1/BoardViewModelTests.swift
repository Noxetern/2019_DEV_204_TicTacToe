//
//  BoardViewModelTests.swift
//  TicTacToeTests
//
//  Created by Ben Algoet on 13/10/2019.
//  Copyright © 2019 2019_DEV_204. All rights reserved.
//

import XCTest
@testable import TicTacToe

class BoardViewModelTests: XCTestCase {

    var viewModel: BoardViewModel!
    var game: Game!

    override func setUp() {
        super.setUp()
        game = Game()
        viewModel = BoardViewModel(game: game)
    }

    override func tearDown() {
        game = nil
        viewModel = nil
        super.tearDown()
    }

    // MARK: - Test Properties

    func testPlayAgainText() {
        XCTAssertEqual(viewModel.playAgainText, "Play again")
    }

    func testHideResetButton() {
        XCTAssertFalse(viewModel.showResetButton)
    }

    func testShowResetButton() {
        // Given
        game.gameState = .draw

        // When
        viewModel = BoardViewModel(game: game)

        // Then
        XCTAssertTrue(viewModel.showResetButton)
    }

    func testGameStateText() {
        XCTAssertEqual(viewModel.gameStateText, game.gameState.description)
    }

    // MARK: - Update board

    func testUpdateBoard() {
        // Given
        let square = SquareButtonView()
        square.tag = 5

        // When
        viewModel.updateBoardAt(square) { [unowned self] isFinished in
            XCTAssertFalse(isFinished)
            XCTAssertEqual(square.status, SquareStatus.OccupiedBy(self.game.currentPlayer.next))
        }
    }

    // MARK: - Reset board

    func testResetBoard() {
        // Given
        game.gameState = .draw

        // When
        viewModel = BoardViewModel(game: game)
        viewModel.isFinished = true
        viewModel.resetBoard()

        // Then
        XCTAssertFalse(viewModel.isFinished)
    }

}
