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
        self.title = "Set Rating"
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        var title = self.title
        let ratingValue = ratingControl.value
        title = "User Rating: \(ratingValue) Star"
        if ratingValue == 1 {
            title?.append("s")
        }
    }
    
}

