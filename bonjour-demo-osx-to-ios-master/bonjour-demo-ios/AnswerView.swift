//
//  AnswerView.swift
//  bonjour-demo-ios
//
//  Created by Angela on 11/27/18.
//  Copyright © 2018 James Zaghini. All rights reserved.
//

import Foundation
import UIKit

class AnswerView : UIViewController {
    
    @IBOutlet var quizDisplay: UITextField!
    
    var quizText = "There is no active quiz at this time...\n\n Please check back later"
    
    override func viewDidLoad() {
        quizDisplay.text = quizText
    }
}
