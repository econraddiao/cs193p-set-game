//
//  TripleComparable.swift
//  cs193p-set-game
//
//  Created by Conrad Diao on 7/13/20.
//  Copyright © 2020 E. Conrad Diao. All rights reserved.
//

import Foundation

protocol TripleComparable: Equatable {
  static func allIdentical(first: Self, second: Self, third: Self) -> Bool
  static func allDistinct(first: Self, second: Self, third: Self) -> Bool
  static func allIdenticalOrDistinct(first: Self, second: Self, third: Self) -> Bool
}

extension TripleComparable {
  static func allIdentical(first: Self, second: Self, third: Self) -> Bool {
    first == second && second == third && first == third
  }
  static func allDistinct(first: Self, second: Self, third: Self) -> Bool {
    first != second && second != third && first != third
  }
  static func allIdenticalOrDistinct(first: Self, second: Self, third: Self) -> Bool {
    allIdentical(first: first, second: second, third: third) ||
      allDistinct(first: first, second: second, third: third)
  }
}
