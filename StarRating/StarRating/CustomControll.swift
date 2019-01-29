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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        for number in 1...5 {
            let newLabel = UILabel()
            newLabel.tag = number
            newLabel.frame.size = CGSize(width: componentDimension, height: componentDimension)
            
            let componentsWidth = CGFloat(number - 1) * componentDimension
            
            let xOrigin = CGFloat((Int(componentsWidth) + 8))

            newLabel.frame.origin = CGPoint(x: xOrigin, y: 0)
            
            newLabel.font = UIFont(name: "bold system font", size: 32)
            newLabel.text = "✰"
            
            if number == 1 {
                newLabel.textColor = componentActiveColor
            } else {
                newLabel.textColor = componentInactiveColor
            }
            self.addSubview(newLabel)
            labelsArray.append(newLabel)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    var value: Int = 1
    
    var labelsArray: [UILabel] = []
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
}
