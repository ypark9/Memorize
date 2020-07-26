//
//  Array+Utils.swift
//  Memorize
//
//  Created by Yoonsoo Park on 7/23/20.
//  Copyright © 2020 Yoonsoo Park. All rights reserved.
//

import Foundation

extension Array where Element : Identifiable {
    func findFirstMatchIndex(of item : Element) -> Int? {
        var returnIndex : Int?
        for index in 0..<self.count {
            if self[index].id == item.id
            {
                returnIndex = index
            }
        }
        return returnIndex
    }
}

extension Array {
    func giveTheOneAndOnly ()-> Element? {
        var itemToReturn : Element?
        if self.count == 1 {
                itemToReturn = first
        }
        return itemToReturn
    }
}
