//
//  Concentration.swift
//  myFirstiOSproject
//
//  Created by 谷井朝美 on 2018-05-23.
//  Copyright © 2018 Asami Tanii. All rights reserved.
//

import Foundation

class Concentration {
    private(set) var cards = [Card]()
//    var cards = Array<Card>()
    
    private var indexOfOneAndOnlyFaceUp: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        // first face up
                        foundIndex = index
                    }
                    else {
                        // second face ip
                        return nil
                    }
                }
            }
            return foundIndex // get must return something
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
            
        }
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card] // we created 3 cards until this line
//            cards.append(card) to append one by one
            // identifier is the same for 1 pair because we copied 2 cards
        }
        
        // TODO: Homework shuffle cards
        for index in 0..<cards.count {
            let index2 = Int(arc4random_uniform(UInt32(cards.count)))
            if index != index2 {
                cards.swapAt(index, index2)
            }
        }
    }
    
    func chooseCard(at index: Int) {
//        if cards[index].isFaceUp {
//            cards[index].isFaceUp = false
//        } else {
//            cards[index].isFaceUp = true
//        }
        
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUp, matchIndex != index {
                // 1 card face up
                if cards[index].identifier == cards[matchIndex].identifier {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFaceUp = true
//                indexOfOneAndOnlyFaceUp = nil // 2 cards face up
            }
            else {
                // 2 cards face up
//                for flipCardsDown in cards.indices {
//                    cards[flipCardsDown].isFaceUp = false
//                }
//                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUp = index
                
            }
        }
    }
}
