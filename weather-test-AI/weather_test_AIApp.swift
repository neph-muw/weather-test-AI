//
//  weather_test_AIApp.swift
//  weather-test-AI
//
//  Created by Roman Mykitchak on 3/21/26.
//

import SwiftUI

@main
struct weather_test_AIApp: App {
    
    @State private var account = Account(userName: "Neph")
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(account)
        }
    }
}
