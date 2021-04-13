//
//  LoginViewModel.swift
//  BitcoinApp
//
//  Created by Montserrat Caballero Montano on 12/04/21.
//

import Foundation
import SwiftUI

final class LoginViewModel: ObservableObject {
  @Published var email = ""
  @Published var password = ""
  @Published var isValid = false
  
  func login() {
    // TODO: Firebase implementation
//    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
//      if error != nil {
//        print(error?.localizedDescription ?? "")
//      } else {
//        print("success")
//      }
//    }
  }
}
