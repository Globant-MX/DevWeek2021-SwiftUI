//
//  WalletView.swift
//  WalletApp
//
//  Created by Montserrat Caballero Montano on 15/04/21.
//

import SwiftUI

struct WalletView: View {

  @ObservedObject private var model: WalletViewModel = WalletViewModel()

  var body: some View {

    ZStack(alignment: .top) {

      VStack {

        HStack {
          Button(action: {
            if model.index != 0 {
              model.index -= 1
            }
          }) {
            Image("left-arrow")
              .renderingMode(.original)
              .resizable().scaledToFit()
              .frame(width: 30, height: 30)
          }
          .opacity(model.index != 0 ? 1 : 0)
          .disabled(model.index != 0 ? false : true)

          Image("bitcoin")
            .resizable().scaledToFit()
            .frame(width: 150, height: 150)

          Button(action: {
            if model.index != model.banner.count {
              model.index += 1
            }
          }) {
            Image("right-arrow")
              .renderingMode(.original)
              .resizable().scaledToFit()
              .frame(width: 30, height: 30)
          }
          .opacity(model.index != model.banner.count - 1 ? 1 : 0)
          .disabled(model.index != model.banner.count - 1 ? false : true)
        }
        .padding(.top, 50)

        VStack(spacing: 20) {
          Text(model.banner[model.index].name)
            .fontWeight(.bold)
            .font(.title)

          Text("$\(model.banner[model.index].exchange)")
            .fontWeight(.bold)
        }

        Spacer()
      }
      .zIndex(1)

      Circle()
        .fill(Color(model.banner[model.index].color).opacity(0.5))
        .frame(width: model.width + 200, height: model.width + 200)
        .padding(.horizontal, -100)
        .offset(y: -model.width)
    }
  }
}

struct WalletView_Previews: PreviewProvider {
  static var previews: some View {
    WalletView()
  }
}
