//
//  PlayingCard.swift
//  Cards
//
//  Created by eugene on 15/04/2018.
//  Copyright © 2018 eugene. All rights reserved.
//

import Foundation

struct PlayingCard  {
  let suit: Suit
  let rank: Rank
  
  enum Suit: String, CustomStringConvertible {
    var description: String {
      return rawValue
    }
    
    case spade = "♠️"
    case clubs = "♣️"
    case diamonds = "♦️"
    case hearts = "♥️"
    
    static var all: [Suit] = [.spade, .clubs, .diamonds, .hearts]
  }
  
  enum Rank {
    case ace
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case quin
    case king
    
    static var all: [Rank] = [.ace, .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .quin, .king]
  }
}

extension PlayingCard: CustomStringConvertible {
  var description: String {
    return "\(rank) \(self.suit)"
  }
  
}

