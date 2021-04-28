//
//  CloseSessionView.swift
//  WalletApp
//
//  Created by Montserrat Caballero Montano on 28/04/21.
//

import SwiftUI

//MARK: CloseSessionView Struct
struct CloseSessionView: View {
  //MARK: Properties
  let action: () -> ()

  //MARK: Body
  var body: some View {
    HStack {
      Spacer()
      Button(action: {
        print("Presionado")
        action()
      }) {
        ZStack {
          Circle()
            .foregroundColor(.init(CGColor(red: 241/255, green: 152/255, blue: 60/255, alpha: 1)))
            .frame(width: 40, height: 40)

          Image("close_session")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height: 30, alignment: .center)

        }
      }
    }
    .offset(y: 50)
    .padding()
  }
}

