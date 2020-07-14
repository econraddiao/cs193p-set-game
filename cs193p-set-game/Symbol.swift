//
//  Shapes.swift
//  cs193p-set-game
//
//  Created by Conrad Diao on 7/14/20.
//  Copyright © 2020 E. Conrad Diao. All rights reserved.
//

import SwiftUI

struct Symbol: Shape {
  func path(in rect: CGRect) -> Path {
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let radius = min(rect.width, rect.height) / 2

    var p = Path()

    return p
  }

  private func makeOval(inDrawingArea drawingRect: CGRect) -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 10, y: 10))
    path.addLine(to: CGPoint(x: 30, y: 10))
    path.addArc(withCenter: CGPoint(x: 30, y: 20), radius: 10, startAngle: -CGFloat.pi / 2, endAngle: CGFloat.pi / 2, clockwise: true)
    path.addLine(to: CGPoint(x: 10, y: 30))
    path.addArc(withCenter: CGPoint(x: 10, y: 20), radius: 10, startAngle: CGFloat.pi / 2, endAngle: -CGFloat.pi / 2, clockwise: true)

    return path
  }

  private func makeSquiggle(inDrawingArea drawingRect: CGRect) -> UIBezierPath {
    let path = UIBezierPath()

    path.move(to: CGPoint(x: 104, y: 15));
    path.addCurve(to: CGPoint(x: 63, y: 54), controlPoint1: CGPoint(x: 112.4, y: 36.9), controlPoint2: CGPoint(x: 89.7, y: 60.8))
    path.addCurve(to: CGPoint(x: 27, y: 53), controlPoint1: CGPoint(x: 52.3, y: 51.3), controlPoint2: CGPoint(x: 42.2, y: 42))
    path.addCurve(to: CGPoint(x: 5, y: 40), controlPoint1: CGPoint(x: 9.6, y: 65.6), controlPoint2: CGPoint(x: 5.4, y: 58.3))
    path.addCurve(to: CGPoint(x: 36, y: 12), controlPoint1: CGPoint(x: 4.6, y: 22), controlPoint2: CGPoint(x: 19.1, y: 9.7))
    path.addCurve(to: CGPoint(x: 89, y: 14), controlPoint1: CGPoint(x: 59.2, y: 15.2), controlPoint2: CGPoint(x: 61.9, y: 31.5))
    path.addCurve(to: CGPoint(x: 104, y: 15), controlPoint1: CGPoint(x: 95.3, y: 10), controlPoint2: CGPoint(x: 100.9, y: 6.9))

    return path
  }

  private func makeDiamond(inDrawingArea drawingRect: CGRect) -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: drawingRect.minX, y: drawingRect.midY))
    path.addLine(to: CGPoint(x: drawingRect.midX, y: drawingRect.minY))
    path.addLine(to: CGPoint(x: drawingRect.maxX, y: drawingRect.midY))
    path.addLine(to: CGPoint(x: drawingRect.midX, y: drawingRect.maxY))
    path.addLine(to: CGPoint(x: drawingRect.minX, y: drawingRect.midY))
    return path
  }
}
