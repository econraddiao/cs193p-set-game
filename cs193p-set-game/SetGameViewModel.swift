//
//  SetGameViewModel.swift
//  cs193p-set-game
//
//  Created by Conrad Diao on 7/13/20.
//  Copyright © 2020 E. Conrad Diao. All rights reserved.
//

import SwiftUI

class SetGameViewModel: ObservableObject {
  @Published private var model: SetGameModel<Int> = SetGameViewModel.createSetGame()

  private static func createSetGame() -> SetGameModel<Int> {
    return SetGameModel<Int>()
  }

  //MARK: - Access to the Model
  var unPlayedCards: [Card] {
    model.unPlayedCards
  }
  var playedCards: [Card] {
    model.playedCards
  }
  var selectedCards: [Card] {
    model.selectedCards
  }
  var matchedCards: [Card] {
    model.matchedCards
  }
  var score: Int {
    model.score
  }

  // MARK: - Intents(s)
  func choose(card: Card) {
    model.choose(card: card)
  }

  func resetGame() {
    model = SetGameViewModel.createSetGame()
  }
}
