//
//  GameTheme.swift
//  Memorize-SwiftUI
//
//  Created by xuanbo Xu on 12/26/22.
//  Copyright © 2022 Easton. All rights reserved.
//

import Foundation

struct Theme<Content> where Content: Equatable  {
    var name: String
    var emojiSet: Array<Content>
    var pairs: Int
    var color: String
    var isRandomPair: Bool
    
    init(name: String, set: Array<Content>, color: String, isRandom: Bool) {
        self.name = name
        self.emojiSet = set
        self.color = color
        self.pairs = set.count
        self.isRandomPair = isRandom
        if isRandom{
            self.pairs = Int.random(in: 1...emojiSet.count)
        }
    }
    
    init(name: String, emojiSet: Array<Content>, pairs: Int, color: String, isRandom: Bool) {
        self.name = name
        self.emojiSet = emojiSet
        self.color = color
        self.pairs = pairs
        self.isRandomPair = isRandom
        if isRandom{
            self.pairs = Int.random(in: 1...emojiSet.count)
        }
    }
}

var carTheme = Theme(name: "MemorizeCars", emojiSet: ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚚"], pairs: 4, color: "red", isRandom: true)
var fruitTheme = Theme(name: "MemorizeFruits", emojiSet: ["🍎","🌶","🥥","🥝","🥔","🧅","🍆","🥕"], pairs: 5, color: "green", isRandom: false)
var foodTheme = Theme(name: "MemorizeFood", emojiSet: ["🍔","🍟","🥗","🍕","🍗","🥐","🍞","🧀"], pairs: 6, color: "yellow", isRandom: false)
var aniTheme = Theme(name: "MemorizeAnimals", emojiSet: ["🐒","🦄","🐴","🐌","🕷","🐢","🐍","🐙"], pairs: 7, color: "purple", isRandom: false)
var sportTheme = Theme(name: "MemorizeSports", emojiSet: ["⛸","🥌","🥅","🥊","🎾","🏓","🎱","⚽️"], pairs: 15, color: "blue", isRandom: true)

var themes = [carTheme, fruitTheme, foodTheme, aniTheme, sportTheme]
