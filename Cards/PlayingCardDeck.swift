//
//  PlayingCardDeck.swift
//  Cards
//
//  Created by eugene on 15/04/2018.
//  Copyright © 2018 eugene. All rights reserved.
//

import Foundation

struct  PlayingCardDeck {
  var deck = [PlayingCard]()
  
  mutating func draw() -> PlayingCard? {
    if deck.isEmpty { return nil }
    return deck.remove(at: deck.count.arc4Random)
  }
  init() {
    for suit in PlayingCard.Suit.all {
      for rank in PlayingCard.Rank.all {
        deck.append(PlayingCard(suit: suit, rank: rank))
      }
    }
  }
  
}

extension Int {
  var arc4Random: Int {
    switch self {
    case 1...Int.max:
      return Int(arc4random_uniform(UInt32(self)))
    case -Int.max..<0:
      return Int(arc4random_uniform(UInt32(self)))
    default:
      return 0
    }
    
}
}
