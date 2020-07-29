//
//  Cardify.swift
//  Memorize
//
//  Created by Yoonsoo Park on 7/28/20.
//  Copyright © 2020 Yoonsoo Park. All rights reserved.
//

import SwiftUI

struct Cardify : ViewModifier {
    var isFaceUp : Bool
    func body(content: Content) -> some View {
        ZStack(content: {
            if self.isFaceUp
            {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth : 3)
                content
            }
            else
            {
//                if !self.isMatched {
//                    RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
//                }
            }
        })
    }
}
