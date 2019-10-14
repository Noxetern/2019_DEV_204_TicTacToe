//
//  BoardViewController.swift
//  TicTacToe
//
//  Created by Ben Algoet on 13/10/2019.
//  Copyright © 2019 2019_DEV_204. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController {

    var viewModel: BoardViewModel = BoardViewModel(game: Game())

    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var gameStateLabel: UILabel!

    // MARK: - Actions
    @IBAction func tapSquare(_ sender: SquareButtonView) {
        viewModel.updateBoardAt(sender) { [unowned self] isFinished in
            self.gameStateLabel.attributedText = self.viewModel.gameStateText
            self.resetButton.isHidden = !isFinished
        }
    }

    @IBAction func playAgain(_ sender: UIButton) {
        viewModel.resetBoard()
        setupInitialView()
    }

    // MARK: - Setup

    override func viewDidLoad() {
        super.viewDidLoad()

        setupInitialView()
        addIdentifiers()
    }

    private func setupInitialView() {
        gameStateLabel.attributedText = viewModel.gameStateText
        resetButton.isHidden = !viewModel.showResetButton
        resetButton.layer.cornerRadius = 10
        resetSquares()
    }

    // MARK: - Square helpers

    private func resetSquares() {
        viewModel.allSquares(view).forEach { $0.status = .empty }
    }

    private func addIdentifiers() {
        viewModel.allSquares(view).forEach { $0.accessibilityIdentifier = "Square \($0.tag)" }
        resetButton.accessibilityIdentifier = viewModel.resetButtonIdentifier
        gameStateLabel.accessibilityIdentifier = viewModel.gameStateLabelIdentifier
    }

}
