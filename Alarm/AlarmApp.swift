//
//  AlarmApp.swift
//  Alarm
//
//  Created by COBY_PRO on 2022/06/27.
//

import SwiftUI

@main
struct AlarmApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext,
                             persistenceController.container.viewContext)
        }
    }
}
