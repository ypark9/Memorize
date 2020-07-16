//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Yoonsoo Park on 7/16/20.
//  Copyright © 2020 Yoonsoo Park. All rights reserved.
//

import Foundation

struct MemorizeGame<CardContent> {
    var cards : Array<Card>
    struct Card{
        var isMatched : Bool
        var isFaceUp : Bool
        var content : CardContent
    }
    
    func choose(card: Card){
        print("Card chosen : \(card)")
    }
    
    // MARK: - init
    init(numberOfCards : Int, cardContentFactory: (Int)->CardContent) {
        cards = Array<Card>();
        
        for pairIndex in 0..<numberOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(isMatched: false, isFaceUp: false, content: content))
            cards.append(Card(isMatched: false, isFaceUp: false, content: content))
        }
    }
    
}
