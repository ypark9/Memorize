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
    {
        get{
            var cardFaceUpIndices = [Int]()
            for index in cards.indices {
                if cards[index].isFaceUp {
                    cardFaceUpIndices.append(index)
                }
            }
            
            if cardFaceUpIndices.count == 1 {
                return cardFaceUpIndices.first
            }
            else {
                return nil
            }
        }
        set{
            for index in cards.indices {
                if index == newValue {
                    cards[index].isFaceUp = true
                }
                else {
                    cards[index].isFaceUp = false
                }
            }
        }
    }
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
                cards[chosenIndex ].isFaceUp = true
                indexOfCareTheOneTheOnlyFaceUpCard = nil
            }
                // chosen card(s) is zero or more than 1
            else {
                indexOfCareTheOneTheOnlyFaceUpCard = chosenIndex
            }
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
