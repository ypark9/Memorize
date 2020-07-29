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
        Grid(viewModel.cards)
        {
            card in
            CardView(card: card).onTapGesture {
                self.viewModel.Choose(card: card)
            }.padding(5)
            
        }
        .padding()
        .foregroundColor(Color.orange)
//        Text("Hello, World!")
    }
}

struct CardView : View {
    var card : MemorizeGame<String>.Card
    var body : some View {
        GeometryReader  { geometry in
            ZStack(content: {
                if self.card.isFaceUp
                {
                    RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                    RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth : 3)
                    Pie(startAngle: Angle.degrees(-90), endAngle: Angle.degrees(20))
                        .opacity(0.4)
                        .padding(5)
                    Text(self.card.content)
                }
                else
                {
                    if !self.card.isMatched {
                        RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
                    }
                }
            })
                .font(Font.system(size: min(geometry.size.width, geometry.size.height) * 0.65))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.Choose(card: game.cards[0])
        return EmojiMemorizeGameView(viewModel: game)
    }
}
