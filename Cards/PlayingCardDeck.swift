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
  init() {
    for suit in PlayingCard.Suit.all {
      for rank in PlayingCard.Rank.all {
        deck.append(PlayingCard(suit: suit, rank: rank))
      }
    }
  }
  
}

