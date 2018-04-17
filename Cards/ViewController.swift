//
//  ViewController.swift
//  Cards
//
//  Created by eugene on 15/04/2018.
//  Copyright © 2018 eugene. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var deck = PlayingCardDeck()
  override func viewDidLoad() {
    super.viewDidLoad()
    //    var deck = PlayingCardDeck()
    //    for card in deck.deck {
    //      print(card)
    //    }
  }
  
  @IBOutlet weak var playingCardView: PlayingCardView! {
    didSet {
      let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
      swipe.direction = [.left, .right]
      playingCardView.addGestureRecognizer(swipe)
      
      let touch = UITapGestureRecognizer(target: self, action: #selector(rotateCard))
      playingCardView.addGestureRecognizer(touch)
    }
  }
  
  @objc func nextCard() {
    if let card = deck.draw() {
      playingCardView.rank = card.rank.rawValue
      playingCardView.suit = card.suit.rawValue
    }
  }
  
  @objc func rotateCard() {
    playingCardView.isFaceUp = !(playingCardView.isFaceUp)
    }
  
  
  
}

