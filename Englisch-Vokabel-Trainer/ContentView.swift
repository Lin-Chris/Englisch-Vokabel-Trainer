//
//  ContentView.swift
//  Englisch-Vokabel-Trainer
//
//  Created by Christian on 01.02.26.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            LearningView()
                .tabItem {
                    Label("Lernen", systemImage: "book.fill")
                }
                .tag(0)
            
            SettingsView()
                .tabItem {
                    Label("Einstellungen", systemImage: "gear")
                }
                .tag(1)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(VocabularyManager())
}
