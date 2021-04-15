//
//  Login.swift
//  BitcoinApp
//
//  Created by Montserrat Caballero Montano on 12/04/21.
//

import SwiftUI
import Lottie

struct LoginView: View {

  @ObservedObject private var model: LoginViewModel = LoginViewModel()

  var body: some View {

    ZStack {
      VStack {
        TextField("Email", text: $model.email)
        SecureField("Password", text: $model.password)



        Button(action: { model.login() }) {
          Text("Sign in")
        }
        .background(NavigationLink(
                      destination: WalletView(),
                      isActive: $model.isWalletView,
                      label: { EmptyView() }))

        HStack(spacing: 12) {
          Text("Don't have an account?")
          Button(action: { model.isSingUp.toggle() }) {
            Text("Sing up now")
              .fontWeight(.bold)
          }
        }
      }
      .padding()
      .fullScreenCover(isPresented: $model.isSingUp) {
        SingUpView(model: model)
      }
    }

    .navigationBarTitle("Login")
  }
}

struct Login_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
