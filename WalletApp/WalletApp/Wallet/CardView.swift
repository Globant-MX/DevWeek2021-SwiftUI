//
//  CardView.swift
//  WalletApp
//
//  Created by Montserrat Caballero Montano on 19/04/21.
//

import SwiftUI

struct CardView: View {
  var card: Card

    var body: some View {
      Image(card.cardImage)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .cornerRadius(15)
        .overlay(
          VStack(alignment: .leading, spacing: 10) {
            Spacer()

            Text(card.cardNumber)
              .font(.title2)
              .fontWeight(.bold)
              .foregroundColor(.white)
              .offset(y: 25)

            Spacer()

            HStack {
              VStack(alignment: .leading, spacing: 4, content: {
                Text("CARD HOLDER")
                  .fontWeight(.bold)
                  .font(.system(size: 14))

                Text(card.cardHolder)
                  .font(.title2)
                  .fontWeight(.bold)
              })

              Spacer(minLength: 10)

              VStack(alignment: .leading, spacing: 4, content: {
                Text("VALID UNTIL")
                  .fontWeight(.bold)
                  .font(.system(size: 14))

                Text(card.cardValidity)
                  .font(.title2)
                  .fontWeight(.bold)
              })
            }
            .foregroundColor(.white)
          }
          .padding()
        )
    }
}

extension View {
  func getRect() -> CGRect {
    return UIScreen.main.bounds
  }
}

