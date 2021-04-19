//
//  WalletViewModel.swift
//  WalletApp
//
//  Created by Montserrat Caballero Montano on 15/04/21.
//

import Foundation
import SwiftUI

final class WalletViewModel: ObservableObject {
  @Published var width = UIScreen.main.bounds.width
  @Published var banner = [
    Banner(name: "Colombia", exchange: 100, color: "col"),
    Banner(name: "México", exchange: 101, color: "mxn"),
    Banner(name: "Argentina", exchange: 102, color: "arg"),
    Banner(name: "USA", exchange: 103, color: "usa")
  ]
  @Published var index = 0
  @Published var startAnimation: Bool = false
  @Published var startCardRotation: Bool = false
  @Published var selectedCard: Card = Card(cardHolder: "", cardNumber: "", cardValidity: "", cardImage: "")
  @Published var cardAnimation: Bool = false
  @Published var scrollAnimation: Bool = false
  @Published var isExpanded: Bool = false
}

