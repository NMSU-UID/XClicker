//
//  Array+removeObject.swift
//  bonjour-demo-mac
//
//  Created by James Zaghini on 12/05/2015.
//  Copyright (c) 2015 James Zaghini. All rights reserved.
//
// Adapted by Elena Davidson, Angela Kearns, and Sergio Barray
// CS 485 User Interface Design
// TPS Functional Prototype Demo
// Thursday, November 29, 2018
//

extension Array {
    mutating func removeObject<U: Equatable>(_ object: U) {
        var index: Int?
        for (idx, objectToCompare) in self.enumerated() {
            if let to = objectToCompare as? U {
                if object == to {
                    index = idx
                }
            }
        }
        
        if(index != nil) {
            self.remove(at: index!)
        }
    }
}
