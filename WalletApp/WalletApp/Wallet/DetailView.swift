//
//  DetailView.swift
//  WalletApp
//
//  Created by Montserrat Caballero Montano on 28/04/21.
//

import SwiftUI

//MARK: DetailView Struct
struct DetailView: View {
  //MARK: Properties
  @ObservedObject var model: WalletViewModel

  //MARK: Body
  var body: some View {
    ZStack(alignment: .topTrailing, content: {
      if model.cardAnimation {
        //MARK: Close Button
        Button(action: {
          withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.7, blendDuration: 0.5)) {
            model.scrollAnimation = false
            model.startCardRotation = false
            model.selectedCard = Card(cardHolder: "", cardNumber: "", cardValidity: "", cardImage: "")
            model.cardAnimation = false
            model.startAnimation = false
          }
        }, label: {
          Image(systemName: "xmark")
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(model.colorScheme != .dark ? .white : .black)
            .padding()
            .background(Color.primary)
            .clipShape(Circle())
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)

        //MARK: Card View
        CardView(card: model.selectedCard)
          .matchedGeometryEffect(id: "CARD_ANIMATION", in: model.animation)
          .padding(.horizontal)
          .frame(maxWidth: .infinity, maxHeight: getRect().height)
      }
    })
  }
}
