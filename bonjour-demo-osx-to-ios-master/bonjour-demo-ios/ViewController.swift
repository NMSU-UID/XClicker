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

class ViewController: UIViewController, BonjourClientDelegate {
    
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var courseNameLabel: UILabel!
    
    @IBOutlet var receivedTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    /* FIX THIS
    // MARK: Navigation
    
    // This method lets you configure a view controller before it's presented.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
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
    }
    */
    
    // MARK: Actions
    // PICK UP HERE ***
    var bonjourClient: BonjourClient!
    
    @IBOutlet var toSendTextField: UITextField!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var connectedToLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bonjourClient = BonjourClient()
        self.bonjourClient.delegate = self
    }
    
    @IBAction func change(_ sender: Any) {
        self.performSegue(withIdentifier: "segue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue,
                 sender: Any?){
        var DestViewController : AnswerView = segue.destination as! AnswerView
        DestViewController.quizText = receivedTextField.text!
        print("breakpoint")
        print(receivedTextField.text!)
    }
    
    func connectedTo(_ socket: GCDAsyncSocket!) {
        self.connectedToLabel.text = "Connected to " + socket.connectedHost
    }
    
    func disconnected() {
        self.connectedToLabel.text = "Disconnected"
    }
    
    func handleBody(_ body: NSString?) {
        self.receivedTextField.text = body as? String
        
        //print(receivedTextField.text!)
    }

    func handleHeader(_ header: UInt) {
        
    }
    
    @IBAction func sendText() {
        if let data = self.toSendTextField.text!.data(using: String.Encoding.utf8) {
            self.bonjourClient.send(data)
        }
    }
}

