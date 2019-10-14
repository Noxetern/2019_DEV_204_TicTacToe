//
//  BoardUITests.swift
//  TicTacToeUITests
//
//  Created by Ben Algoet on 13/10/2019.
//  Copyright © 2019 2019_DEV_204. All rights reserved.
//

import XCTest

class BoardUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launchArguments += ["-enableTestMode", "1"]
        app.launch()
        continueAfterFailure = false
    }

    override func tearDown() {
        super.tearDown()
        app.terminate()
        app = nil
    }

    // MARK: - Square behaviour

    // Test if 9 squares are present
    func testVisibleSquares() {
        for i in 1...9 {
            let square = app.buttons["Square \(i)"]
            XCTAssertTrue(square.waitForExistence(timeout: 1))
        }
    }

    // Test tap on empty square
    func testTapEmptySquare() {

        let square = app.buttons["Square 5"]
        XCTAssertTrue(square.waitForExistence(timeout: 1))

        // First tap to change image to cross
        square.tap()
        let screenshotBefore = square.screenshot()

        // Second tap to confirm image does not change
        square.tap()
        let screenshotAfter = square.screenshot()

        // Validate screenshot before and after are the same
        XCTAssertEqual(screenshotBefore.pngRepresentation, screenshotAfter.pngRepresentation)
    }

    // Test if player changes from X to O
    func testTurnChange() {
        let mainView = app.otherElements["MainView"]
        XCTAssertTrue(mainView.waitForExistence(timeout: 1))

        // First tap should add a X to square 5
        let firstSquare = app.buttons["Square 5"]
        XCTAssertTrue(firstSquare.waitForExistence(timeout: 1))
        firstSquare.tap()
        let screenshotBefore = mainView.screenshot()

        // Second tap should add a O to square 4
        let secondSquare = app.buttons["Square 4"]
        XCTAssertTrue(secondSquare.waitForExistence(timeout: 1))
        secondSquare.tap()
        let screenshotAfter = mainView.screenshot()

        // ScreenshotBefore should contain 1 X
        // ScreenshotAfter should contain both an X and O
        XCTAssertNotEqual(screenshotBefore.pngRepresentation, screenshotAfter.pngRepresentation)
    }

    // MARK: - Game flow

    /*:
        x o x
        o x o
        x - -
    */
    func testGameWin() {

        for i in 1...9 {
            app.buttons["Square \(i)"].tap()
        }

        // X should have won
        let gameStateLabel = app.staticTexts["GameState"]
        XCTAssertEqual(gameStateLabel.label, "Player X wins")
        // resetButton should be hittable
        let resetButton = app.buttons["ResetButton"]
        XCTAssertTrue(resetButton.isHittable)
    }

    /*:
        x o x
        x o x
        o x o
    */
    func testGameDraw() {

        // The sequence our test needs to tap to declare a draw
        let tapSequence = [1, 2, 3, 5, 4, 7, 6, 9, 8]
        for i in tapSequence {
            app.buttons["Square \(i)"].tap()
        }

        // Game should be draw
        let gameStateLabel = app.staticTexts["GameState"]
        XCTAssertEqual(gameStateLabel.label, "Draw")
        // resetButton should be hittable
        let resetButton = app.buttons["ResetButton"]
        XCTAssertTrue(resetButton.isHittable)
    }
}
