//
//  Player.swift
//  TicTacToe
//
//  Created by Ben Algoet on 13/10/2019.
//  Copyright © 2019 2019_DEV_204. All rights reserved.
//

import UIKit

enum Player: Int {
    case X = 1
    case O = 2

    var name: String {
        switch self {
        case .X:
            return "Cross"
        case .O:
            return "Nought"
        }
    }

    var next: Player {
        switch self {
        case .X:
            return .O
        case .O:
            return .X
        }
    }

}
