//
//  ContentView.swift
//  Memorize-SwiftUI
//
//  Created by xuanbo Xu on 12/20/22.
//  Copyright © 2022 Easton. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gameVM = GameViewModel()
    
    var body: some View {
        VStack{
            Text(gameVM.getThemeName).font(.largeTitle)
            Text("Score: \(gameVM.getScore)").font(.title2).multilineTextAlignment(.center)
            ScrollView{
                HStack{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 85, maximum: 250))], content: {
                        ForEach(gameVM.getCards) { (card) in
                            CardView(card: card, mainColor: gameVM.getColor).aspectRatio(2/3,contentMode: .fit
                            ).onTapGesture {
                                gameVM.choose(card)
                            }
                        }
                    })
                }
            }
            Button(action: {gameVM.newGame()}, label: {
                Text("New game")
                    .padding(5.0)
            }).background(gameVM.getColor).foregroundColor(.white).cornerRadius(3.0).font(.largeTitle)
//            HStack{
//                remove
//                Spacer()
//                add
//            }
//            .font(.largeTitle).padding().foregroundColor(.blue)
        }.padding(.horizontal).foregroundColor(gameVM.getColor)
    }
    
//    var add: some View{
//        Button(action: {
//            if self.eCount < self.emojis.count-1 {
//                self.eCount+=1
//            }
//        }, label:{ Image(systemName: "plus.circle")})
//    }
//
//    var remove: some View{
//        Button(action: {
//            if self.eCount > 1 {
//                self.eCount-=1
//            }
//        }, label:{ Image(systemName: "minus.circle")})
//    }
}



struct CardView: View {
    var card: GameModel<String>.Card
    var mainColor: Color
    var shape = RoundedRectangle(cornerRadius: 20)
    var body: some View{
        ZStack {
            if card.isMached{
                shape.opacity(0)
            }else if card.isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth:5)
                Text(card.content)
                    .font(.largeTitle)
            }else{
                shape.fill(LinearGradient(gradient: Gradient(colors: [mainColor, .white]), startPoint: .top, endPoint: .bottom))
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
