//
//  ViewController.swift
//
//  Created by James Zaghini on 6/05/2015.
//  Copyright (c) 2015 James Zaghini. All rights reserved.
//
// Adapted by Elena Davidson, Angela Kearns, and Sergio Barray
// CS 485 User Interface Design
// TPS Functional Prototype Demo
// Thursday, November 29, 2018
//

import UIKit
import os.log

class ViewController: UIViewController, UITextFieldDelegate, BonjourClientDelegate {
    func handleBody(_ body: NSString?) {
        self.receivedTextField.text = body as? String
        
        quizAlert()
    }
    
    
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sectionTextField: UITextField!
    @IBOutlet weak var professorTextField: UITextField!
    
    @IBOutlet weak var courseNameLabel: UILabel!
    
    @IBOutlet var receivedTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    /*
     This value is either passed by `MealTableViewController` in `prepare(for:sender:)`
     or constructed as part of adding a new meal.
     */
    var course: Course?
    
    var bonjourClient: BonjourClient!
    
    @IBOutlet var toSendTextField: UITextField!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var connectedToLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the Bonjour input.
        self.bonjourClient = BonjourClient()
        self.bonjourClient.delegate = self
    }
    
    @IBAction func quizAlert() {
        print("Hello, World")
        let alertController = UIAlertController(title: "New Quiz Started", message: "Click OK to go to quiz", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title:"OK", style: .default, handler:  { action in self.performSegue(withIdentifier: "Open Quiz", sender: self) }))
    
        present(alertController, animated: true, completion: nil)
    }


    
    override func prepare(for segue: UIStoryboardSegue,
                 sender: Any?){
        if segue.identifier == "Open Quiz"{
            let DestViewController : AnswerView = segue.destination as! AnswerView
            DestViewController.quizText = receivedTextField.text!
            print("breakpoint")
            print(receivedTextField.text!)
        } else {
            super.prepare(for: segue, sender: sender)
            
            // Configure the destination view controller only when the save button is pressed.
            guard let button = sender as? UIBarButtonItem, button === saveButton else {
                if #available(iOS 10.0, *) {
                    os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
                } else {
                    // Fallback on earlier versions
                }
                return
            }
            
            let name = nameTextField.text ?? ""
            let sectionnum = sectionTextField.text ?? ""
            let professor = professorTextField.text ?? ""
            
            // Set the meal to be passed to MealTableViewController after the unwind segue.
            course = Course(name: name, sectionnum: sectionnum, professor: professor)
        }
    }
    
    func connectedTo(_ socket: GCDAsyncSocket!) {
        self.connectedToLabel.text = "Connected to " + socket.connectedHost
    }
    
    func disconnected() {
        self.connectedToLabel.text = "Disconnected"
    }
    
   

    func handleHeader(_ header: UInt) {
        
    }
    
    @IBAction func sendText() {
        if let data = self.toSendTextField.text!.data(using: String.Encoding.utf8) {
            self.bonjourClient.send(data)
            if self.toSendTextField.text! != ""{
                let alertController = UIAlertController(title: "Message Sent", message:
                    self.toSendTextField.text, preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
                self.present(alertController, animated: true, completion: nil)
                self.toSendTextField.text = ""
            }
        }
    }
    
    // MARK: UITextField Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        courseNameLabel.text = textField.text
    }
    
    // MARK: Navigation
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // This method lets you configure a view controller before it's presented.
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            if #available(iOS 10.0, *) {
                os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            } else {
                // Fallback on earlier versions
            }
            return
        }
        
        let name = nameTextField.text ?? ""
        
        // Set the meal to be passed to MealTableViewController after the unwind segue.
        course = Course(name: name)
    }*/
    
    // MARK: Actions
}
