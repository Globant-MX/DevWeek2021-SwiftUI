//
//  SingUpView.swift
//  BitcoinApp
//
//  Created by Montserrat Caballero Montano on 13/04/21.
//

import SwiftUI

struct SingUpView: View {
  @ObservedObject var model : LoginViewModel
  
  var body: some View {
    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {

      VStack {
        Spacer(minLength: 0)

        Image(systemName: "swift")
          .padding(.horizontal)
          .padding(.vertical, 20)

        Text("New Profile")
          .font(.system(size: 35, weight: .heavy))
          .padding(.top)

        VStack(spacing:20) {
          TextField("Email", text: $model.email)
          SecureField("Password", text: $model.password)
          SecureField("Re-Enter", text: $model.reEnterPassword)
          Button(action: { }) {
            Text("Sign up")
          }
        }

        Spacer(minLength: 0)
      }

      Button(action: { model.isSingUp.toggle() }) {
        Image(systemName: "xmark")
          .foregroundColor(.white)
          .padding()
          .background(Color.black.opacity(0.6))
          .clipShape(Circle())
      }
      .padding(.trailing)
      .padding(.top, 10)
    }

  }
}

struct SingUpView_Previews: PreviewProvider {
  static var previews: some View {
    SingUpView(model: LoginViewModel())
  }
}
