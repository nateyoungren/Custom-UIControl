//
//  ViewController.swift
//  StarRating
//
//  Created by Nathanael Youngren on 1/29/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "User Rating: 1 Star"
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        let ratingValue = ratingControl.value
        self.title = "User Rating: \(ratingValue) Star"
        if ratingValue != 1 {
            self.title?.append("s")
        }
    }
    
}

