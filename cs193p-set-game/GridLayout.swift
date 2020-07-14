//
//  GridLayout.swift
//  supreme-octo-broccoli
//
//  Created by Conrad Diao on 7/12/20.
//  Copyright © 2020 E. Conrad Diao. All rights reserved.
//

import SwiftUI

struct GridLayout {
  private(set) var size: CGSize
  private(set) var rowCount: Int = 0
  private(set) var colCount: Int = 0

  init(itemCount: Int, nearAspectRatio desiredAspectRatio: Double = 1, in size: CGSize) {
    self.size = size
    //if our size is zero width or height or the itemCount is not > 0
    //then we have no work to do (because our rowCount & colCount will be zero)
    guard size.width != 0, size.height != 0, itemCount > 0 else { return }
    //find bestLayout... one which results in cells whose aspectRato has the
    //smallestVariance from desiredAspectRatio
    var bestLayout: (rowCount: Int, colCount: Int) = (1, itemCount)
    var smallestVariance: Double?
    let sizeAspectRatio = abs(Double(size.width / size.height))
    for rows in 1...itemCount {
      let cols = (itemCount / rows) + (itemCount % rows > 0 ? 1 : 0)
      if (rows - 1) * cols < itemCount {
        let itemAspectRatio = sizeAspectRatio * (Double(rows) / Double(cols))
        let variance = abs(itemAspectRatio - desiredAspectRatio)
        if smallestVariance == nil || variance < smallestVariance! {
          smallestVariance = variance
          bestLayout = (rowCount: rows, colCount: cols)
        }
      }
    }
    rowCount = bestLayout.rowCount
    colCount = bestLayout.colCount
  }

  var itemSize: CGSize {
    if rowCount == 0 || colCount == 0 {
      return CGSize.zero
    } else {
      return CGSize(
        width: size.width / CGFloat(colCount),
        height: size.height / CGFloat(rowCount)
      )
    }
  }

  func location(ofItemAt index: Int) -> CGPoint {
    if rowCount == 0 || colCount == 0 {
      return CGPoint.zero
    } else {
      return CGPoint(
        x: (CGFloat(index % colCount) + 0.5) * itemSize.width,   
        y: (CGFloat(index / colCount) + 0.5) * itemSize.height)
    }
  }
}
