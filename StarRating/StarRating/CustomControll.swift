//
//  CustomControll.swift
//  StarRating
//
//  Created by Nathanael Youngren on 1/29/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touch = touch.location(in: self)
        
                return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touch = touch.location(in: self)
        
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
    }
    
    override func cancelTracking(with event: UIEvent?) {
        
    }
    
    var value: Int = 1
    
}
