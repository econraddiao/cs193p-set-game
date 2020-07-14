//
//  Array+Identifiable.swift
//  supreme-octo-broccoli
//
//  Created by Conrad Diao on 7/13/20.
//  Copyright © 2020 E. Conrad Diao. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
func firstIndex(matching: Element) -> Int? {
    for index in 0..<self.count {
      if self[index].id == matching.id {
        return index
      }
    }
    return nil
  }
}
