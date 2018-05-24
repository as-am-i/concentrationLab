//
//  Card.swift
//  myFirstiOSproject
//
//  Created by 谷井朝美 on 2018-05-23.
//  Copyright © 2018 Asami Tanii. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
        // use static func, otherwise always initialize to get 1 for identifier
    }
    
}
