//
//  GameModel.swift
//  Memorize-SwiftUI
//
//  Created by xuanbo Xu on 12/25/22.
//  Copyright © 2022 Easton. All rights reserved.
//

import Foundation
struct GameModel <Content> where Content: Equatable {
    private(set) var cards: Array<Card>
    private(set) var theme: Theme<Content>
    private(set) var score = 0
    private var preChoosenId: Int?
    private var preChoosenTime: Date?
    
    mutating func choose(_ card: Card){
        if let index = cards.firstIndex(where: {$0.id == card.id})
           ,!cards[index].isMached
           ,!cards[index].isFaceUp{
            if let preId = preChoosenId{
                if cards[preId].content == cards[index].content{
                    cards[preId].isMached = true
                    cards[index].isMached = true
                    if let preTime = preChoosenTime{
                        score += max((10+Int(preTime.timeIntervalSinceNow)), 1)
                    }
                }else if cards[index].isWatched{
                    score -= 1
                }
                preChoosenId = nil
                preChoosenTime = nil
            }else {
                for id in cards.indices{
                    cards[id].isFaceUp = false
                }
                preChoosenId = index
                preChoosenTime = Date()
            }
            cards[index].isFaceUp.toggle()
            cards[index].isWatched = true
        }
        
    }
    
//    init(numOfPairs:Int, createCard:(Int) -> Content) {
//        cards = Array<Card>()
//        for num in 0..<numOfPairs{
//            let tmp = createCard(num)
//            cards.append(Card(id: num*2, content: tmp))
//            cards.append(Card(id: num*2+1, content: tmp))
//        }
//    }
    
    init(gameTheme: Theme<Content>) {
        theme = gameTheme
        cards = Array<Card>()
        var range = theme.emojiSet.count-1
        if theme.pairs > theme.emojiSet.count{
            theme.pairs = theme.emojiSet.count
        }
        for i in 0..<theme.pairs{
            let getOneId = Int.random(in: 0...range)
            cards.append(Card(id: i*2, content: theme.emojiSet[getOneId]))
            cards.append(Card(id: i*2+1, content: theme.emojiSet[getOneId]))
            theme.emojiSet.swapAt(range, getOneId)
            range -= 1
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp = false
        var isMached = false
        var isWatched = false
        var content: Content
    }
    

}
