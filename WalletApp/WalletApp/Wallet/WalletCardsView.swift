//
//  WalletCardsView.swift
//  WalletApp
//
//  Created by Montserrat Caballero Montano on 28/04/21.
//

import SwiftUI

//MARK: WalletCardsView Struct
struct WalletCardsView: View {
  //MARK: Properties
  @ObservedObject var model: WalletViewModel

  //MARK: Body
  var body: some View {
    VStack {
      ZStack {
        //MARK: Bunch of Cards
        ForEach(cards.indices.reversed(), id: \.self) { index in
          CardView(card: cards[index])
            .scaleEffect(model.selectedCard.id == cards[index].id ? 1 : index == 0 ? 1 : 0.90)
            .rotationEffect(.init(degrees: model.startAnimation ? 0 : index == 1 ? -15 : (index == 2 ? 15 : 0)))
            .onTapGesture { model.animatedView(card: cards[index]) }
            .offset(y: model.startAnimation ? 0 : index == 1 ? 60 : (index == 2 ? -60 : 0))
            .matchedGeometryEffect(id: "CARD_ANIMATION", in: model.animation)
            .rotationEffect(.init(degrees: model.selectedCard.id == cards[index].id && model.startCardRotation ? -90 : 0))
            .zIndex(model.selectedCard.id == cards[index].id ? 1000 : 0)
            .opacity(model.startAnimation ? model.selectedCard.id == cards[index].id ? 1 : 0 : 1)
        }
      }
      .rotationEffect(.init(degrees: 90))
      .frame(height: getRect().width - 30)
      .scaleEffect(0.9)
      .padding(.top, 20)

      VStack(alignment: .leading, spacing: 6, content: {
        //MARK: Total Label
        Text("Total Amount Spent")
          .font(.callout)
          .fontWeight(.bold)
          .foregroundColor(.gray)

        //MARK: Amount Label
        Text("$1,451.00")
          .font(.title)
          .fontWeight(.bold)
          .foregroundColor(.primary)
      })
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.top, 20)
    }
    .padding()
  }
}
