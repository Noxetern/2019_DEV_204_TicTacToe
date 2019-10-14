//
//  String+ColorAttributed.swift
//  TicTacToe
//
//  Created by Ben Algoet on 14/10/2019.
//  Copyright © 2019 2019_DEV_204. All rights reserved.
//

import UIKit

extension String {
    
    func addColorAttribute(_ rangeText: String, color: UIColor) -> NSMutableAttributedString {
        let range = (self as NSString).range(of: rangeText)
        
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        return attributedString
    }
    
}
