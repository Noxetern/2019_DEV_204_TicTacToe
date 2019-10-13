//
//  SquareStatus.swift
//  TicTacToe
//
//  Created by Ben Algoet on 13/10/2019.
//  Copyright © 2019 2019_DEV_204. All rights reserved.
//

import UIKit

enum SquareStatus: Equatable {
    case empty
    case OccupiedBy(Player)

    var isEmpty: Bool {
        switch self {
        case .empty:
            return true
        case .OccupiedBy(_):
            return false
        }
    }

    var image: UIImage? {
        switch self {
        case .empty:
            return nil
        case .OccupiedBy(let player):
            return UIImage(named: player.name + ".png")
        }
    }
}
