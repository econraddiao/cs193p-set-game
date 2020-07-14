//
//  SetGame.swift
//  cs193p-set-game
//
//  Created by Conrad Diao on 7/13/20.
//  Copyright © 2020 E. Conrad Diao. All rights reserved.
//

import Foundation

// MARK: - Set Game Model
struct SetGameModel<CardProperty> where CardProperty: Hashable{
  var unPlayedCards = [Card]()
  var playedCards = [Card]()
  var selectedCards = [Card]()
  var matchedCards = [Card]()
  var score = 0
  var isComplete: Bool {
    return matchedCards.count == Int(pow(Double(Card.CardProperty.allValues.count), 4.0))
  }

  init() {
    let numberOfVariations = Card.CardProperty.allValues.count
    for color in 0..<numberOfVariations {
      for number in 0..<numberOfVariations {
        for symbol in 0..<numberOfVariations {
          for shading in 0..<numberOfVariations {
            unPlayedCards.append(Card(id: unPlayedCards.count + 1,
                                 color: Card.CardProperty.allValues[color],
                                 number: Card.CardProperty.allValues[number],
                                 symbol: Card.CardProperty.allValues[symbol],
                                 shading: Card.CardProperty.allValues[shading]))
            print("\(String(describing: unPlayedCards.last?.id))")
          }
        }
      }
    }
    unPlayedCards.shuffle()
    drawMultipleCards(number: 12)
  }

  mutating func choose(card: Card) {
    var indexOfPreviouslySelectedCard = selectedCards.firstIndex(of:card)

    if selectedCards.count == 3 {
      indexOfPreviouslySelectedCard = nil
      selectedCards.removeAll()
    } else if selectedCards.count == 2 {
      // score successful + unsuccessful matches
      if Card.doFormSetOfThree(first: selectedCards[0], second: selectedCards[1], third: card) {
        score += 3
        let newMatchedCards = [selectedCards[0], selectedCards[1], card]

        matchedCards.append(contentsOf: newMatchedCards)
        for matchedCard in newMatchedCards {
          let inPlayIndex = playedCards.firstIndex(of: matchedCard)
          if let index = inPlayIndex {
            if !unPlayedCards.isEmpty {
              playedCards[index] = unPlayedCards.popLast()!
            } else {
              playedCards.remove(at: index)
            }
          }
        }
        indexOfPreviouslySelectedCard = nil
        selectedCards.removeAll()
      } else {
        score -= 5
      }
    }
    if indexOfPreviouslySelectedCard == nil && !matchedCards.contains(card) {
      selectedCards.append(card)
    } else if let index = indexOfPreviouslySelectedCard {
      selectedCards.remove(at: index)
    }
  }

  mutating func choose(at index: Int) {
    if index < playedCards.count {
      let selectedCard = playedCards[index]
      choose(card: selectedCard)
    }
  }

  mutating func drawMultipleCards(number: Int) {
    if !unPlayedCards.isEmpty && unPlayedCards.count >= number {
      playedCards.append(contentsOf: unPlayedCards[0..<number])
      unPlayedCards.removeSubrange(0..<number)
    }
  }
}
