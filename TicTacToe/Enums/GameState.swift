//
//  GameState.swift
//  TicTacToe
//
//  Created by Ben Algoet on 13/10/2019.
//  Copyright © 2019 2019_DEV_204. All rights reserved.
//

import UIKit

enum GameState: Equatable {
    case draw
    case wonBy(_ player: Player)
    case turnOff(_ player: Player)
}
