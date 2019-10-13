//
//  SquareButtonView.swift
//  TicTacToe
//
//  Created by Ben Algoet on 13/10/2019.
//  Copyright © 2019 2019_DEV_204. All rights reserved.
//

import Foundation
import UIKit

class SquareButtonView: UIButton {

    // Initial status is always empty
    var status: SquareStatus = .empty {
        didSet {
            self.setImage(status.image, for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Set default image insets
        let inset: CGFloat = 10
        self.imageEdgeInsets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }

}
