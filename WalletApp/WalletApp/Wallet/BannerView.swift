//
//  BannerView.swift
//  WalletApp
//
//  Created by Montserrat Caballero Montano on 28/04/21.
//

import SwiftUI

//MARK: BannerView Struct
struct BannerView: View {
  //MARK: Properties
  @ObservedObject var model: WalletViewModel

  //MARK: Body
  var body: some View {
    HStack {
      //MARK: Left Banner Button
      Button(action: {
        model.decrementIndex()
      }) {
        Image(systemName: "arrow.left.circle.fill")
          .renderingMode(.original)
          .resizable().scaledToFit()
          .frame(width: 30, height: 30)
      }
      .opacity(model.index != 0 ? 1 : 0)
      .disabled(model.index != 0 ? false : true)

      //MARK: Bitcoin Image
      Image("bitcoin")
        .resizable().scaledToFit()
        .frame(width: 150, height: 150)

      //MARK: Right Banner Button
      Button(action: {
        model.incrementIndex()
      }) {
        Image(systemName: "arrow.right.circle.fill")
          .renderingMode(.original)
          .resizable().scaledToFit()
          .frame(width: 30, height: 30)
      }
      .opacity(model.index != model.banner.count - 1 ? 1 : 0)
      .disabled(model.index != model.banner.count - 1 ? false : true)
    }
    .padding(.top, 50)


    VStack(spacing: 15) {
      //MARK: Country Label
      Text(model.banner[model.index].name)
        .fontWeight(.bold)
        .font(.title)
      //MARK: Exchange label
      Text("$\(model.banner[model.index].exchange)")
        .fontWeight(.bold)
    }
  }
}
