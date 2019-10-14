//
//  UIColor+custom.swift
//  TicTacToe
//
//  Created by Ben Algoet on 14/10/2019.
//  Copyright © 2019 2019_DEV_204. All rights reserved.
//

import UIKit

extension UIColor {
    
    struct BoardColor {
        static let crossBlue = UIColor(red: 135, green: 195, blue: 232)
        static let noughtYellow = UIColor(red: 255, green: 227, blue: 139)
        static let grayBackground = UIColor(red: 93, green: 84, blue: 79)
        static let lightTextColor = UIColor(red: 242, green: 242, blue: 247)
    }
    
}

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
}
