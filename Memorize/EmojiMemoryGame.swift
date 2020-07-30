//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yoonsoo Park on 7/16/20.
//  Copyright © 2020 Yoonsoo Park. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame : ObservableObject {
    @Published private var model : MemorizeGame<String> = CreateMemorizeGame();
    
    static func CreateMemorizeGame()->MemorizeGame<String> {
        let cardsCollection = [["👻","🕷","🕸","🎃","🍭","🩸"],["😺","😸","😹","😻","🙀"],["🐋","🐳","🐟","🐠","🐡"]]
        let randomInt = Int.random(in: 0..<3)
        return MemorizeGame<String>(numberOfPairCards: cardsCollection[randomInt].count) { (pairIndex : Int) -> String in
            cardsCollection[randomInt][pairIndex]
        }
    }
    var cards : Array<MemorizeGame<String>.Card> {
        model.cards;
    }
    
    // MARK: - intents
    func Choose(card : MemorizeGame<String>.Card) -> Void {
        model.choose(card: card);
    }
    
    func ResetGame() -> Void {
        model = EmojiMemoryGame.CreateMemorizeGame();
    }
}
