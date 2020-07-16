//
//  ContentView.swift
//  Memorize
//
//  Created by Yoonsoo Park on 7/14/20.
//  Copyright © 2020 Yoonsoo Park. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(content: {
            ForEach(0..<4, content: { index in
                CardView(isFaceUP: false);
            })
        })
        
        
        .padding()
        .foregroundColor(Color.orange)
//        Text("Hello, World!")
    }
}

struct CardView : View {
    var isFaceUP : Bool = false
    var body : some View {
          ZStack(content: {
            if isFaceUP
            {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth : 3)
                Text("👻").font(Font.largeTitle)
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
        ContentView()
    }
}
