  //
//  ContentView.swift
//  cs193p-set-game
//
//  Created by Conrad Diao on 7/13/20.
//  Copyright © 2020 E. Conrad Diao. All rights reserved.
//

import SwiftUI

struct SetGameView: View {

  @ObservedObject var viewModel: SetGameViewModel

  var body: some View {
    VStack {
      Grid(viewModel.playedCards) { card in
        CardView(card: card).onTapGesture {
          withAnimation(.linear) {
            self.viewModel.choose(card: card)
          }
        }
        .padding(5)
      }
      .padding()
      .foregroundColor(Color.pink)
      .font(Font.largeTitle)
      Button(action: {
        withAnimation(.easeInOut) {
          self.viewModel.resetGame()
        }
      }, label: { Text("New Game") })
    }
  }

  struct CardView: View {
    var card: Card

    var body: some View {
      GeometryReader { geometry in
        self.body(for: geometry.size)
      }
    }

    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        ZStack {
          Text(String(card.id))
        }
        .cardify(isFaceUp: true)
        .transition(AnyTransition.scale)
    }

  }
}

struct SetGameView_Previews: PreviewProvider {
  static var previews: some View {
      let game = SetGameViewModel()
      return SetGameView(viewModel: game)
  }
}
