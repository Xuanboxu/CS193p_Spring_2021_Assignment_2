//
//  GameVM.swift
//  Memorize-SwiftUI
//
//  Created by xuanbo Xu on 12/25/22.
//  Copyright © 2022 Easton. All rights reserved.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    
    @Published private var model = GameModel(gameTheme: themes.randomElement()!)
    
    var getCards: Array<GameModel<String>.Card> {
        model.cards
    }
    
    var getColor: Color{
        switch model.theme.color {
        case "red":
            return Color.red
        case "green":
            return Color.green
        case "purple":
            return Color.purple
        case "yellow":
            return Color.yellow
        default:
            return Color.blue
        }
    }
    
    var getThemeName: String{
        model.theme.name
    }
    
    var getScore: Int{
        model.score
    }
    
    func choose(_ card:GameModel<String>.Card){
        model.choose(card)
    }
    
    func newGame(){
        model = GameModel(gameTheme: themes.randomElement()!)
    }
    
    
}
