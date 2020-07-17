//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yoonsoo Park on 7/16/20.
//  Copyright © 2020 Yoonsoo Park. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    private var model : MemorizeGame<String> = CreateMemorizeGame();
    
    static func CreateMemorizeGame()->MemorizeGame<String> {
        let cardsCollection = ["👻","🕷","🕸","🎃","🍭","🩸"]
        return MemorizeGame<String>(numberOfPairCards: cardsCollection.count) { (pairIndex : Int) -> String in
            cardsCollection[pairIndex]
        }
    }
    
    var cards : Array<MemorizeGame<String>.Card> {
        model.cards;
    }
    
    func Choose(card : MemorizeGame<String>.Card) -> Void {
        model.choose(card: card);
    }
    
}
