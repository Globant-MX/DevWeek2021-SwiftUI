//
//  WalletView.swift
//  WalletApp
//
//  Created by Montserrat Caballero Montano on 15/04/21.
//

import SwiftUI

//MARK: WalletView Struct
struct WalletView: View {

  //MARK: Properties
  @ObservedObject private var model: WalletViewModel = WalletViewModel()
  @Environment(\.presentationMode) var presentationMode

  //MARK: Body
  var body: some View {

    ScrollView {
      ZStack(alignment: .top) {
        VStack {
          if !model.scrollAnimation {
            //MARK: Menu and profile
            MenuView(model: model)

            // MARK: Banner
            BannerView(model: model)

          }

          // MARK: Cards
          WalletCardsView(model: model)

          Spacer()
        }
        .zIndex(1)
        .padding()

        // Close session
        if model.isExpanded {
          CloseSessionView(action: {presentationMode.wrappedValue.dismiss()})
          .zIndex(1)
        }

        Circle()
          .fill(Color(model.banner[model.index].color).opacity(0.5))
          .frame(width: model.width + 200, height: model.width + 200)
          .padding(.horizontal, -100)
          .offset(y: -model.width)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .blur(radius: model.cardAnimation ? 100 : 0)
      .overlay(

        // MARK: Card Detail View
        DetailView(model: model)

      )
    }
    .navigationBarTitle("")
    .navigationBarHidden(true)

  }
}

struct WalletView_Previews: PreviewProvider {
  static var previews: some View {
    WalletView()
  }
}
