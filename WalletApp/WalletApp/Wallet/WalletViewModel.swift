//
//  WalletViewModel.swift
//  WalletApp
//
//  Created by Montserrat Caballero Montano on 15/04/21.
//

import Foundation
import SwiftUI

//MARK: WalletViewModel class
final class WalletViewModel: ObservableObject {
  //MARK: Banner Properties
  var width = UIScreen.main.bounds.width
  var banner = [
    Banner(name: "Colombia", exchange: 100, color: "col"),
    Banner(name: "México", exchange: 101, color: "mxn"),
    Banner(name: "Argentina", exchange: 102, color: "arg"),
    Banner(name: "USA", exchange: 103, color: "usa")
  ]
  @Published var index = 0
  //MARK: Animation Properties
  @Published var startAnimation: Bool = false
  @Published var startCardRotation: Bool = false
  var selectedCard: Card = Card(cardHolder: "", cardNumber: "", cardValidity: "", cardImage: "")
  @Published var cardAnimation: Bool = false
  @Published var scrollAnimation: Bool = false
  @Published var isExpanded: Bool = false
  //MARK: Other Property Wrappers
  @Environment(\.colorScheme) var colorScheme

  //MARK: Methods
  func animatedView(card: Card) {
    selectedCard = card

    withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.5, blendDuration: 0.5)) {
      startAnimation = true
    }

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
      withAnimation(.spring()) {
        self.startCardRotation = true
      }
    }

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
      withAnimation(.spring()) {
        self.scrollAnimation = true
      }
    }

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
      withAnimation(.spring()) {
        self.cardAnimation = true
      }
    }
  }

  func incrementIndex() {
    if index != banner.count {
      index += 1
    }
  }

  func decrementIndex() {
    if index != 0 {
      index -= 1
    }
  }
}

