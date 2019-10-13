//
//  BoardViewController.swift
//  TicTacToe
//
//  Created by Ben Algoet on 13/10/2019.
//  Copyright © 2019 2019_DEV_204. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController {

    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var gameStateLabel: UILabel!

    @IBAction func tapSquare(_ sender: SquareButtonView) {

    }

    @IBAction func playAgain(_ sender: UIButton) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    private func setupView() {
        // TODO: Show base gamestate info
        // TODO: resetButton should hide/show based on gamestate
        resetButton.isHidden = true
        resetSquares()
    }

    private func resetSquares() {
        // Set images of all 9 SquareButtonViews back to nil
        for i in 1...9 {
            guard let squareButtonView = view.viewWithTag(i) as? SquareButtonView else { return }
            squareButtonView.setImage(nil, for: .normal)
        }
    }

}
