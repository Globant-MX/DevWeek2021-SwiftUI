//
//  LoginViewModel.swift
//  BitcoinApp
//
//  Created by Montserrat Caballero Montano on 12/04/21.
//

import Foundation
import SwiftUI
import Firebase

//MARK: WalletViewModel class
final class LoginViewModel: ObservableObject {
  //MARK: Login Properties
  @Published var email: String  = ""
  @Published var password: String = ""
  @Published var isSingUp: Bool = false
  //MARK: Sing Up Properties
  @Published var singUpEmail: String = ""
  @Published var singUpPassword: String = ""
  @Published var reEnterPassword: String = ""
  //MARK: Change View Properties
  @Published var isWalletView: Bool = false
  //MARK: Lottie Properties
  @Published var show: Bool = false

  //MARK: Methods
  func login() {
    // TODO: Firebase implementation
//    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
//      if error != nil {
//        print(error?.localizedDescription ?? "")
//      } else {
//        print("success")
//      }
//    }
    withAnimation {
      isWalletView.toggle()
    }
  }
}
