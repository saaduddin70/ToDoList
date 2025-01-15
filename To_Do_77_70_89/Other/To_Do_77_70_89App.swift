//
//  To_Do_77_70_89App.swift
//  To_Do_77_70_89
//
//  Created by Tonmoy
//

import FirebaseCore
import SwiftUI

@main
struct To_Do_77_70_89App: App {
    
    init()
    {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
