//
//  SquareStatusTests.swift
//  TicTacToeTests
//
//  Created by Ben Algoet on 13/10/2019.
//  Copyright © 2019 2019_DEV_204. All rights reserved.
//

import XCTest
@testable import TicTacToe

class SquareStatusTests: XCTestCase {

    var status: SquareStatus!
    var currentPlayer: Player!

    override func setUp() {
        super.setUp()
        currentPlayer = .X
        status = .empty

    }

    override func tearDown() {
        status = nil
        super.tearDown()
    }

    // MARK: - Player tests

    func testCurrentStatus() {
        XCTAssertEqual(status, SquareStatus.empty)
    }

    func testIsEmpty() {
        XCTAssertTrue(status.isEmpty)
    }

    func testNoPlayerImage() {
        XCTAssertNil(status.image)
    }

    func testPlayerImage() {
        status = .OccupiedBy(.O)
        let noughtImage = UIImage(named: "Nought.png")

        XCTAssertEqual(status.image, noughtImage)
    }

}
