//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yoonsoo Park on 7/16/20.
//  Copyright © 2020 Yoonsoo Park. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    
    private var model : MemorizeGame<String> = MemorizeGame<String>(numberOfCards: 2) { (Int) -> String in
        return "👻"
    }
    var cards : Array<MemorizeGame<String>.Card> {
        model.cards;
    }
    
    func Choose(card : MemorizeGame<String>.Card) -> Void {
        model.choose(card: card);
    }
    
}
