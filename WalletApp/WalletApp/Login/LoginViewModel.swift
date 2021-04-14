//
//  LoginViewModel.swift
//  BitcoinApp
//
//  Created by Montserrat Caballero Montano on 12/04/21.
//

import Foundation
import SwiftUI
import Firebase

final class LoginViewModel: ObservableObject {
  @Published var email: String  = ""
  @Published var password: String = ""
  @Published var isSingUp: Bool = false
  @Published var singUpEmail: String = ""
  @Published var singUpPassword: String = ""
  @Published var reEnterPassword: String = ""
  
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
