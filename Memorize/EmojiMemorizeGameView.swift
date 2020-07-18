//
//  ContentView.swift
//  Memorize
//
//  Created by Yoonsoo Park on 7/14/20.
//  Copyright © 2020 Yoonsoo Park. All rights reserved.
//

import SwiftUI

struct EmojiMemorizeGameView: View {
    @ObservedObject var viewModel : EmojiMemoryGame
    var body: some View {
        HStack(content: {
            ForEach(viewModel.cards, content: { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.Choose(card: card)
                }
            })
        })
        
        .padding()
        .foregroundColor(Color.orange)
//        Text("Hello, World!")
    }
}

struct CardView : View {
    var card : MemorizeGame<String>.Card
    var body : some View {
          ZStack(content: {
            if card.isFaceUp
            {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth : 3)
                Text(card.content).font(Font.largeTitle)
            }
            else
            {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemorizeGameView(viewModel: EmojiMemoryGame())
    }
}
