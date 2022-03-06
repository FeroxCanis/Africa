//
//  AfricaApp.swift
//  Africa
//
//  Created by Ferox on 2/5/22.
//

import SwiftUI

@main
struct AfricaApp: App {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
                MainView()
            }
        }
    }
}
