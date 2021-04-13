//
//  Login.swift
//  BitcoinApp
//
//  Created by Montserrat Caballero Montano on 12/04/21.
//

import SwiftUI

struct Login: View {

  @ObservedObject private var user = LoginViewModel()

  var body: some View {
    VStack {
      TextField("Email", text: $user.email)
      SecureField("Password", text: $user.password)
      Button(action: { user.login() }) {
        Text("Sign in")
      }
    }
    .padding()
    .navigationBarTitle("Login")
  }
}

struct Login_Previews: PreviewProvider {
  static var previews: some View {
    Login()
  }
}
