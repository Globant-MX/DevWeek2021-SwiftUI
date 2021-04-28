//
//  MenuView.swift
//  WalletApp
//
//  Created by Montserrat Caballero Montano on 28/04/21.
//

import SwiftUI

//MARK: MenuView Struct
struct MenuView: View {
  //MARK: Properties
  @ObservedObject var model: WalletViewModel

  //MARK: Body
  var body: some View {
    HStack(spacing: 15) {
      //MARK: Menu
      Button(action: {}, label: {
        Image(systemName: "line.horizontal.3.decrease.circle.fill")
          .font(.title)
          .foregroundColor(.primary)
      })

      //MARK: Welcome message
      Text("Welcome back !!!")
        .font(.title2)
        .fontWeight(.bold)

      Spacer(minLength: 0)

      //MARK: Profile
      Button(action: {
        model.isExpanded.toggle()
      }, label: {
        Image("profile")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 40, height: 40)
          .clipShape(Circle())
      })

    }
  }
}
