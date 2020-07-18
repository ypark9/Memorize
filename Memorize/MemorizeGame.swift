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
    
    mutating func choose(card: Card){
        print("Card chosen : \(card)")
        let chosenIndex = Index(of : card)
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
    }
    
    func Index(of card: Card)->Int {
        var found = -1;
        for index in 0..<cards.count {
            if cards[index].id == card.id
            {
                found = index;
                break
            }
        }
        return found;
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
