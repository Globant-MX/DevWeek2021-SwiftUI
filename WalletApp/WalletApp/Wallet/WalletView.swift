//
//  WalletView.swift
//  WalletApp
//
//  Created by Montserrat Caballero Montano on 15/04/21.
//

import SwiftUI

struct WalletView: View {

  @ObservedObject private var model: WalletViewModel = WalletViewModel()
  @Namespace var animation
  @Environment(\.colorScheme) var colorScheme
  @Environment(\.presentationMode) var presentationMode

  var body: some View {

    ScrollView {
      ZStack(alignment: .top) {
        VStack {
          if !model.scrollAnimation {
            HStack(spacing: 15) {
              Button(action: {}, label: {
                Image(systemName: "line.horizontal.3.decrease.circle.fill")
                  .font(.title)
                  .foregroundColor(.primary)
              })

              Text("Welcom back !!!")
                .font(.title2)
                .fontWeight(.bold)

              Spacer(minLength: 0)

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

            HStack {
              Button(action: {
                if model.index != 0 {
                  model.index -= 1
                }
              }) {
                Image(systemName: "arrow.left.circle.fill")
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
              Text(model.banner[model.index].name)
                .fontWeight(.bold)
                .font(.title)

              Text("$\(model.banner[model.index].exchange)")
                .fontWeight(.bold)
            }

          }

          VStack {
            ZStack {
              ForEach(cards.indices.reversed(), id: \.self) { index in
                CardView(card: cards[index])
                  .scaleEffect(model.selectedCard.id == cards[index].id ? 1 : index == 0 ? 1 : 0.90)
                  .rotationEffect(.init(degrees: model.startAnimation ? 0 : index == 1 ? -15 : (index == 2 ? 15 : 0)))
                  .onTapGesture { animatedView(card: cards[index]) }
                  .offset(y: model.startAnimation ? 0 : index == 1 ? 60 : (index == 2 ? -60 : 0))
                  .matchedGeometryEffect(id: "CARD_ANIMATION", in: animation)
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
              Text("Total Amount Spent")
                .font(.callout)
                .fontWeight(.bold)
                .foregroundColor(.gray)

              Text("$1,451.00")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 20)
          }
          .padding()

          Spacer()
        }
        .zIndex(1)
        .padding()

        if model.isExpanded {
          HStack {
            Spacer()
            Button(action: {
              print("Presionado")
              presentationMode.wrappedValue.dismiss()
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
          .zIndex(2)
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

        ZStack(alignment: .topTrailing, content: {
          if model.cardAnimation {
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
                .foregroundColor(colorScheme != .dark ? .white : .black)
                .padding()
                .background(Color.primary)
                .clipShape(Circle())
            })
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)

            CardView(card: model.selectedCard)
              .matchedGeometryEffect(id: "CARD_ANIMATION", in: animation)
              .padding(.horizontal)
              .frame(maxWidth: .infinity, maxHeight: getRect().height)
          }
        })

      )
    }
    .navigationBarTitle("")
    .navigationBarHidden(true)
    
  }

  func animatedView(card: Card) {
    model.selectedCard = card

    withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.5, blendDuration: 0.5)) {
      model.startAnimation = true
    }

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
      withAnimation(.spring()) {
        model.startCardRotation = true
      }
    }

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
      withAnimation(.spring()) {
        model.scrollAnimation = true
      }
    }

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
      withAnimation(.spring()) {
        model.cardAnimation = true
      }
    }
  }
  
}

struct WalletView_Previews: PreviewProvider {
  static var previews: some View {
    WalletView()
  }
}
