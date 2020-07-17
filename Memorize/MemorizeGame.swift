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
    struct Card : Identifiable{
        var isMatched : Bool = false
        var isFaceUp : Bool = false
        var content : CardContent
        var id : Int
    }
    
    func choose(card: Card){
        print("Card chosen : \(card)")
    }
    
    // MARK: - init
    init(numberOfPairCards : Int, cardContentFactory: (Int)->CardContent) {
        cards = Array<Card>();
        
        for pairIndex in 0..<numberOfPairCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
}
