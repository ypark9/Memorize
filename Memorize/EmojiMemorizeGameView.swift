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
        VStack{
            Grid(viewModel.cards)
            {
                card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear) {self.viewModel.Choose(card: card)}
                }.padding(5)
                
            }
            .padding()
            .foregroundColor(Color.orange)
            Button(action: {
                withAnimation(.easeIn(duration: 1)) {self.viewModel.ResetGame()}
            }, label: {Text("New Game")})
        }
        
    }
}

struct CardView : View {
    
    var card : MemorizeGame<String>.Card
    
    var body : some View {
        GeometryReader  { geometry in
            if self.card.isFaceUp || !self.card.isMatched {
                ZStack{
                    Pie(startAngle: Angle.degrees(-90), endAngle: Angle.degrees(20))
                        .opacity(0.4)
                        .padding(5)
                    Text(self.card.content)
                        .font(Font.system(size: min(geometry.size.width, geometry.size.height) * 0.65))
                        .rotationEffect(Angle.degrees(self.card.isMatched ? 360 : 0))
                        .animation(self.card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
                }
                .modifier(Cardify(isFaceUp: self.card.isFaceUp))
                .transition(AnyTransition.scale)
                .rotation3DEffect(Angle.degrees(self.card.isFaceUp ? 180 : 0), axis: (0, 1, 0))
            }
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
