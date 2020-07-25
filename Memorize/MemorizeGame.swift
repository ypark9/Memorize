//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Yoonsoo Park on 7/16/20.
//  Copyright © 2020 Yoonsoo Park. All rights reserved.
//

import Foundation

struct MemorizeGame<CardContent> where CardContent : Equatable{
    var indexOfCareTheOneTheOnlyFaceUpCard: Int?
    var cards : Array<Card>
    struct Card : Identifiable{
        var isMatched : Bool = false
        var isFaceUp : Bool = false
        var content : CardContent
        var id : Int
    }
    
    mutating func choose(card: Card){
        //print("Card chosen : \(card)")
        if let chosenIndex = cards.findFirstMatchIndex(of : card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched{
            if let potentialMatchedIndex = indexOfCareTheOneTheOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchedIndex].content{
                    cards[potentialMatchedIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                }
                indexOfCareTheOneTheOnlyFaceUpCard = nil
            }
                // chosen card(s) is zero or more than 1
            else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfCareTheOneTheOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex ].isFaceUp = !cards[chosenIndex ].isFaceUp
        }
    }
    
    // MARK: - init
    init(numberOfPairCards : Int, cardContentFactory: (Int)->CardContent) {
        cards = Array<Card>();
        let randomInt = Int.random(in: 0..<6)
        //let randomInt = 2
        for pairIndex in 0..<numberOfPairCards {
            let content = cardContentFactory(pairIndex)
            for numOfPairs in 0..<randomInt
            {
                cards.append(Card(content: content, id: pairIndex * numberOfPairCards + numOfPairs))
            }
        }
        cards.shuffle()
    }
    
}
