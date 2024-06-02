//
//  BankIncApp.swift
//  BankInc
//
//  Created by Nompilo Moyo on 2024/06/02.
//

import SwiftUI

@main
struct BankIncApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                LoginView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
