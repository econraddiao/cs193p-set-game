//
//  Array+Only.swift
//  supreme-octo-broccoli
//
//  Created by Conrad Diao on 7/13/20.
//  Copyright © 2020 E. Conrad Diao. All rights reserved.
//

import Foundation

extension Array {
  var only: Element? {
    count == 1 ? first : nil
  }
}

extension Array {
  var isTriple: Array? {
    count == 3 ? self : nil
  }
}
