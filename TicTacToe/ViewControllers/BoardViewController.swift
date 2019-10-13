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
            self.gameStateLabel.text = self.viewModel.gameStateText
            self.resetButton.isHidden = !isFinished
        }
    }

    @IBAction func playAgain(_ sender: UIButton) {
    }

    // MARK: - Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    private func setupView() {
        gameStateLabel.text = viewModel.gameStateText
        resetButton.isHidden = !viewModel.showResetButton
        resetSquares()
    }

    private func resetSquares() {
        // Set status of all squareButtons back to .empty
        for i in 1...9 {
            guard let squareButtonView = view.viewWithTag(i) as? SquareButtonView else { return }
            squareButtonView.status = .empty
        }
    }

}
