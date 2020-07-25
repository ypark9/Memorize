//
//  Grid.swift
//  Memorize
//
//  Created by Yoonsoo Park on 7/20/20.
//  Copyright © 2020 Yoonsoo Park. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item : Identifiable, ItemView : View {
    var items : [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items : [Item], viewForItem : @escaping (Item)-> ItemView) {
        self.items = items;
        self.viewForItem = viewForItem;
    }
    var body: some View {
        GeometryReader{ geometry in
            self.body(layout: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
    func body(layout : GridLayout)-> some View{
        ForEach(self.items){ item in
            self.viewForItem(item)
                .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                .position(x: layout.location(ofItemAt: (self.items.findFirstMatchIndex(of: item) ?? 0)).x,
                        y: layout.location(ofItemAt: (self.items.findFirstMatchIndex(of: item)) ?? 0).y)
        }
    }
    
}
