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
    
    var quizText = String()
    
    override func viewDidLoad() {
        quizDisplay.text = quizText
    }
}
