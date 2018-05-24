//
//  ViewController.swift
//  myFirstiOSproject
//
//  Created by 谷井朝美 on 2018-05-22.
//  Copyright © 2018 Asami Tanii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    // Computed Properties
    var numberOfPairsOfCards: Int {
        return cardButtons.count / 2
    }
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    private var emojiOptions = ["🐝", "🦄", "🐸", "🐳", "🐘", "🦁", "🦊", "🐙"]
    private var emoji = [Int:String]() // array of dictionary  var emoji = Dictionary<Int:Stirng>()
    
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var flipCountLabel: UILabel!

    // MARK: Methods
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardIndex = cardButtons.index(of: sender) {
            game.chooseCard(at: cardIndex)
            updateViewFromModel()
//            flipCard(withEmoji: emojiOptions[cardIndex], on: sender)
        }
        
//        let cardIndex = cardButtons.index(of: sender)!
//        flipCard(withEmoji: emojiOptions[cardIndex], on: sender)
//        This might be crashed because cardIndex is Optional and you will force it to have
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for :card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControlState.normal) // to face down
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
            }
        }
    }
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiOptions.count > 0 {
//            let randomIndex = Int(arc4random_uniform(UInt32(emojiOptions.count)))
            emoji[card.identifier] = emojiOptions.remove(at: emojiOptions.count.arc4random)
        }
        return emoji[card.identifier] ?? "?"
        // ?? is to get "?" when the if condition does not match
    }
    
//    func flipCard(withEmoji emoji: String, on button: UIButton) {
//        if button.currentTitle == emoji {
//            button.setTitle("", for: UIControlState.normal) // to face down
//            button.backgroundColor = #colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)
//        } else {
//            button.setTitle(emoji, for: UIControlState.normal)
//            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        }
//    }
    
//    @IBAction func touchSecondCard(_ sender: UIButton) {
//        flipCount += 1
//        print("I am Bee!")
//    }
    
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
        else {
            return 0
        }
    }
}

