//
//  SplashView.swift
//  WalletApp
//
//  Created by Montserrat Caballero Montano on 06/05/21.
//

import SwiftUI
import Lottie

//MARK: Splash View
struct SplashView: UIViewRepresentable {
  //MARK: Properties
  @Binding var show: Bool

  //MARK: Methods
  func makeUIView(context: Context) -> AnimationView {
    let view = AnimationView(name: "splash", bundle: Bundle.main)
    view.play { (status) in
      if status {
        withAnimation(.interactiveSpring(response:0.7, dampingFraction: 0.8, blendDuration: 0.8)) {
          show.toggle()
        }
      }
    }
    return view
  }

  func updateUIView(_ uiView: AnimationView, context: Context) {
    //TODO: Implementation
  }
}
