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
    
    @IBOutlet var buttonA: UIButton!
    @IBOutlet var buttonB: UIButton!
    @IBOutlet var buttonC: UIButton!
    @IBOutlet var buttonD: UIButton!
    
    @IBAction func buttonAClick(_ sender: UIButton) {
        buttonA.isSelected = true
        buttonB.isSelected = false
        buttonC.isSelected = false
        buttonD.isSelected = false
    }
    @IBAction func buttonBClick(_ sender: UIButton) {
        buttonA.isSelected = false
        buttonB.isSelected = true
        buttonC.isSelected = false
        buttonD.isSelected = false
    }
    @IBAction func buttonCClick(_ sender: UIButton) {
        buttonA.isSelected = false
        buttonB.isSelected = false
        buttonC.isSelected = true
        buttonD.isSelected = false
    }
    @IBAction func buttonDClick(_ sender: UIButton) {
        buttonA.isSelected = false
        buttonB.isSelected = false
        buttonC.isSelected = false
        buttonD.isSelected = true
    }
    
    
    var quizText = "There is no active quiz at this time...\n\n Please check back later."
    
    override func viewDidLoad() {
        quizDisplay.text = quizText
        if quizDisplay.text == "There is no active quiz at this time...\n\n Please check back later." {
                buttonA.isHidden = true
                buttonB.isHidden = true
                buttonC.isHidden = true
                buttonD.isHidden = true
        }
    }
}
