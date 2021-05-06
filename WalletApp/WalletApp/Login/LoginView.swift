//
//  Login.swift
//  BitcoinApp
//
//  Created by Montserrat Caballero Montano on 12/04/21.
//

import SwiftUI
import Lottie

//MARK: WalletView Struct
struct LoginView: View {
  //MARK: Properties
  @ObservedObject private var model: LoginViewModel = LoginViewModel()

  //MARK: Body
  var body: some View {
    VStack {
      ZStack {
        VStack {
          SplashView(show: $model.show)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)

          VStack {
            HStack {
              VStack(alignment: .leading, spacing: 10, content: {
                Text("Login")
                  .font(.title)
                  .fontWeight(.bold)
                  .foregroundColor(.black)

                Text("Enter your email to continue")
                  .foregroundColor(.gray)
              })

              Spacer(minLength: 15)
            }

            VStack {
              TextField("Email", text: $model.email)
                .background(Color.white)
                .cornerRadius(5)

              SecureField("Password", text: $model.password)
                .background(Color.white)
                .cornerRadius(5)

              Divider()
            }
            .padding(.vertical)

            Button(action: { model.login() }, label: {
              Text("Sing In")
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.vertical, 10)
                .frame(width: UIScreen.main.bounds.width - 60, height: 30)
                .background(Color.orange)
                .clipShape(Capsule())
            })
            .background(NavigationLink(
                          destination: WalletView(),
                          isActive: $model.isWalletView,
                          label: { EmptyView() }))

            HStack(spacing: 20) {
              Button(action: { model.isSingUp.toggle() }, label: {
                HStack(spacing: 10) {
                  Text("Sing up now")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                }
                .padding(.vertical, 10)
                .frame(width: UIScreen.main.bounds.width - 60, height: 30)
                .background(Color.orange)
                .clipShape(Capsule())
              })
            }
          }
          .padding()
          .background(Color("col"))
          .cornerRadius(20)
          .padding()
          .frame(height: model.show ? nil : 0)
          .opacity(model.show ? 1 : 0)
        }
        .padding()
        .fullScreenCover(isPresented: $model.isSingUp) {
          SingUpView(model: model)
        }
      }
    }
  }
}

struct Login_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
