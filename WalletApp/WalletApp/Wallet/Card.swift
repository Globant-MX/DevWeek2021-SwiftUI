//
//  Card.swift
//  WalletApp
//
//  Created by Montserrat Caballero Montano on 19/04/21.
//

import Foundation

struct Card: Identifiable {
  var  id = UUID().uuidString
  var cardHolder: String
  var cardNumber: String
  var cardValidity: String
  var cardImage: String
}

var cards = [
  Card(cardHolder: "IJUSTIN", cardNumber: "1234 8889 7621 0981", cardValidity: "01/2025", cardImage: "card3"),
  Card(cardHolder: "KAVIYA", cardNumber: "8889 7621 0981 1234", cardValidity: "01/2025", cardImage: "card2"),
  Card(cardHolder: "JENNA EZARIK", cardNumber: "0981 9816 1234 8638", cardValidity: "01/2025", cardImage: "card1"),
  Card(cardHolder: "STEVE", cardNumber: "7621 0981 1234 8889", cardValidity: "01/2025", cardImage: "card3")
]
