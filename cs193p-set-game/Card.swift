//
//  Card.swift
//  cs193p-set-game
//
//  Created by Conrad Diao on 7/13/20.
//  Copyright © 2020 E. Conrad Diao. All rights reserved.
//

import Foundation

struct Card: Identifiable {
  var id: Int
  let color: CardProperty
  let number: CardProperty
  let symbol: CardProperty
  let shading: CardProperty

  enum CardProperty: Int, TripleComparable {
    case primary = 1
    case secondary
    case tertiary

    static var allValues: [CardProperty] { return [.primary, .secondary, .tertiary] }
  }

  static func doFormSetOfThree(first: Card, second: Card, third: Card) -> Bool {
    let colorsMatch = CardProperty.allIdenticalOrDistinct(
      first: first.color, second: second.color, third: third.color)
    let numbersMatch = CardProperty.allIdenticalOrDistinct(
      first: first.number, second: second.number, third: third.number)
    let symbolsMatch = CardProperty.allIdenticalOrDistinct(
      first: first.symbol, second: second.symbol, third: third.symbol)
    let shadingsMatch = CardProperty.allIdenticalOrDistinct(
      first: first.shading, second: second.shading, third: third.shading)

    return colorsMatch && numbersMatch && symbolsMatch && shadingsMatch
  }
}

extension Card: Hashable {
  static func == (lhs: Card, rhs: Card) -> Bool {
    return lhs.color == rhs.color &&
      lhs.number == rhs.number &&
      lhs.symbol == rhs.symbol &&
      lhs.shading == rhs.shading
  }
  func hash(into hasher: inout Hasher) {
    hasher.combine(color)
    hasher.combine(number)
    hasher.combine(symbol)
    hasher.combine(shading)
  }
}
