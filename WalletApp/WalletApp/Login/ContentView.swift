//
//  ContentView.swift
//  BitcoinApp
//
//  Created by Montserrat Caballero Montano on 12/04/21.
//

import SwiftUI

//MARK: ContentView Struct
struct ContentView: View {
  var body: some View {
    NavigationView {
      LoginView()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
