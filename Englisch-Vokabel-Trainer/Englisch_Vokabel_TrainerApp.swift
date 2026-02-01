//
//  Englisch_Vokabel_TrainerApp.swift
//  Englisch-Vokabel-Trainer
//
//  Created by Christian on 01.02.26.
//

import SwiftUI

@main
struct Englisch_Vokabel_TrainerApp: App {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = true
    @StateObject private var vocabularyManager = VocabularyManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vocabularyManager)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
