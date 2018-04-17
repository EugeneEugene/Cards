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
  
  enum Rank: Int {
    case ace = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10
    case jack = 11
    case quin = 12
    case king = 13
    
    
    static var all: [Rank] = [.ace, .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .quin, .king]
  }
}

extension PlayingCard: CustomStringConvertible {
  var description: String {
    return "\(rank) \(self.suit)"
  }
  
}

