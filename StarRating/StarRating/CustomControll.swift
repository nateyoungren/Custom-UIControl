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
        updateValue(at: touch)
        return true
    }

    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchLocation = touch.location(in: self)
        if bounds.contains(touchLocation) {
            sendActions(for: .touchDragInside)
            updateValue(at: touch)
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        
        guard let touch = touch else { return }
        let touchLocation = touch.location(in: self)
        if bounds.contains(touchLocation) {
            sendActions(for: .touchUpInside)
            updateValue(at: touch)
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    func updateValue(at touch: UITouch) {
        for label in labelsArray {
            let touchLocation = touch.location(in: self)
            if label.bounds.contains(touchLocation) {
                value = label.tag
                label.textColor = componentActiveColor
                sendActions(for: .valueChanged)
            } else {
                label.textColor = componentInactiveColor
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {

        for number in 1...5 {
            let newLabel = UILabel()
            let componentsWidth = Int(CGFloat(number - 1) * componentDimension)
            let xOrigin = CGFloat(componentsWidth + (8 * number))
            
            newLabel.tag = number
            newLabel.frame.size = CGSize(width: componentDimension, height: componentDimension)
            newLabel.bounds = CGRect(x: xOrigin, y: 0, width: componentDimension, height: componentDimension)
            newLabel.frame.origin = CGPoint(x: xOrigin, y: 0)
            newLabel.textAlignment = NSTextAlignment.center
            newLabel.clipsToBounds = true
            newLabel.font = UIFont.boldSystemFont(ofSize: 32)
            newLabel.text = "✪"
            
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
