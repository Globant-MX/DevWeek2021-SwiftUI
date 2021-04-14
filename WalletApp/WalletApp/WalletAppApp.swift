//
//  WalletAppApp.swift
//  WalletApp
//
//  Created by Montserrat Caballero Montano on 14/04/21.
//

import SwiftUI
import Firebase

@main
struct WalletAppApp: App {

  @UIApplicationDelegateAdaptor(Delegate.self) var delegate

  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}

class Delegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

    //FirebaseApp.configure()

    return true
  }
}
