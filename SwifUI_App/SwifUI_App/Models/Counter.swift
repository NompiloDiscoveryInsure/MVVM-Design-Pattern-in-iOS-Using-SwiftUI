//
//  Counter.swift
//  SwifUI_App
//
//  Created by Nompilo Moyo on 2024/03/04.
//

import Foundation

struct Counter {
    var value: Int = 0
    var isPremium: Bool = false
    
    mutating func increment() {
        value += 1
        
        //business logic
        if value.isMultiple(of: 3) {
            // premium
            isPremium = true
        } else {
            // not premium
            isPremium = false
        }
    }
}
