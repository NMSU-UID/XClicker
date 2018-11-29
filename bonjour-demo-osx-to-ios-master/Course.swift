//
//  Course.swift
//  bonjour-demo-ios
//
//  Created by Elena on 11/27/18.
//  Copyright © 2018 James Zaghini. All rights reserved.
//

import UIKit

class Course {
    
    // MARK: Properties
    
    var name: String
    var sectionnum: String
    var professor: String
    
    // MARK: Initialization
    
    init?(name:String, sectionnum:String, professor:String) {
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty  {
            return nil
        }
        
        // Initialize stored properties
        self.name = name
        self.sectionnum = sectionnum
        self.professor = professor
        
    }
}
