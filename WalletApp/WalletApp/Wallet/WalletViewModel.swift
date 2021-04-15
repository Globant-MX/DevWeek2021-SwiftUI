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
}

