//
//  PlayingCardView.swift
//  Cards
//
//  Created by eugene on 15/04/2018.
//  Copyright © 2018 eugene. All rights reserved.
//

import UIKit

@IBDesignable
class PlayingCardView: UIView {
  
  @IBInspectable
  var rank: Int = 11 { didSet {setNeedsDisplay(); setNeedsLayout()} }
  @IBInspectable
  var suit: String = "♥️" { didSet {setNeedsDisplay(); setNeedsLayout()} }
  @IBInspectable
  var isFaceUp = true  { didSet {setNeedsDisplay(); setNeedsLayout()} }
  
  private func centeredAttributedString(_ string: String, fontSize: CGFloat) -> NSAttributedString {
    var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
    font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = .center
    return NSAttributedString(string: string, attributes: [.paragraphStyle: paragraphStyle, .font: font])
  }
  
  private var cornerString: NSAttributedString {
    return centeredAttributedString(rankString+"\n"+suit, fontSize: cornerFontSize)
  }
  
  lazy private var upperLeftCornerLabel = createCornerLabel()
  lazy private var lowerRightCornerLabel = createCornerLabel()
  
  private func createCornerLabel() -> UILabel {
    let label = UILabel()
    label.numberOfLines = 0
    addSubview(label)
    return label
  }
  
  private func configureCornerLabel(_ label: UILabel) {
    label.attributedText = cornerString
    label.frame.size = CGSize.zero
    label.sizeToFit()
    label.isHidden = !isFaceUp
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    configureCornerLabel(upperLeftCornerLabel)
    upperLeftCornerLabel.frame.origin = bounds.origin.offsetBy(dx: cornerOffset, dy: cornerOffset)
    
    
    configureCornerLabel(lowerRightCornerLabel)
    lowerRightCornerLabel.transform = CGAffineTransform .identity.translatedBy(x: lowerRightCornerLabel.frame.size.width, y: lowerRightCornerLabel.frame.size.height).rotated(by: CGFloat.pi)
    lowerRightCornerLabel.frame.origin = CGPoint(x: bounds.maxX, y: bounds.maxY).offsetBy(dx: -cornerOffset, dy: -cornerOffset).offsetBy(dx: -lowerRightCornerLabel.frame.size.width, dy: -lowerRightCornerLabel.frame.size.height )
  }
  
  override func draw(_ rect: CGRect) {
    print(cornerString)
    let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
    roundedRect.addClip()
    UIColor.white.setFill()
    roundedRect.fill()
    if isFaceUp {
    if let faceCardImage = UIImage(named: rankString+suit) {
      faceCardImage.draw(in: bounds.zoom(by: SizeRatio.faceCardImageSizeToBoundsSize))
    }
    }
    else {
      if let faceCardImage = UIImage(named: "cardback") {
        faceCardImage.draw(in: bounds.zoom(by: SizeRatio.faceCardImageSizeToBoundsSize))
      }
    }
  }
  
}

extension PlayingCardView {
  private struct SizeRatio {
    static let cornerFontSizeToBoundsHeight: CGFloat = 0.085
    static let cornerRadiusToBoundsHeight: CGFloat = 0.06
    static let cornerOffsetToCornerRadius: CGFloat = 0.33
    static let faceCardImageSizeToBoundsSize: CGFloat = 0.75
  }
  
  private var cornerRadius: CGFloat {
    return bounds.size.height * SizeRatio.cornerRadiusToBoundsHeight
  }
  
  private var cornerOffset: CGFloat {
    return cornerRadius * SizeRatio.cornerOffsetToCornerRadius
  }
  
  private var cornerFontSize: CGFloat {
    return bounds.size.height * SizeRatio.cornerFontSizeToBoundsHeight
  }
  
  private var rankString: String {
    switch rank {
    case 1: return "A"
    case 2...10: return String(rank)
    case 11: return "J"
    case 12: return "Q"
    case 13: return "K"
    default: return "?"
    }
  }
}

extension CGPoint {
  func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
    return CGPoint(x: x + dx, y: y + dy)
  }
}

extension CGRect {
  func zoom(by zoomFactor: CGFloat) -> CGRect {
    let zoomedWidth = size.width * zoomFactor
    let zoomedHeight = size.height * zoomFactor
    let originX = origin.x + (size.width - zoomedWidth) / 2
    let originY = origin.y + (size.height - zoomedHeight) / 2
    return CGRect(origin: CGPoint(x: originX,y: originY) , size: CGSize(width: zoomedWidth, height: zoomedHeight))
  }
  
  var leftHalf: CGRect {
    let width = size.width / 2
    return CGRect(origin: origin, size: CGSize(width: width, height: size.height))
  }
  
  var rightHalf: CGRect {
    let width = size.width / 2
    return CGRect(origin: CGPoint(x: origin.x + width, y: origin.y), size: CGSize(width: width, height: size.height))
  }
}

