//
//  SettingsView.swift
//  Englisch-Vokabel-Trainer
//
//  Settings and vocabulary management interface
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var vocabularyManager: VocabularyManager
    @AppStorage("isDarkMode") private var isDarkMode: Bool = true
    @AppStorage("showSyllables") private var showSyllables: Bool = false
    
    @State private var showAddVocabulary: Bool = false
    @State private var showResetAlert: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                // Appearance Section
                Section(header: Text("Darstellung")) {
                    Toggle(isOn: $isDarkMode) {
                        HStack {
                            Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                                .foregroundColor(isDarkMode ? .blue : .orange)
                            Text("Dark Mode")
                        }
                    }
                    
                    Toggle(isOn: $showSyllables) {
                        HStack {
                            Image(systemName: "textformat.size")
                                .foregroundColor(.purple)
                            Text("Silbentrennung anzeigen")
                        }
                    }
                }
                
                // Learning Settings Section
                Section(header: Text("Lerneinstellungen")) {
                    Toggle(isOn: $vocabularyManager.shuffleMode) {
                        HStack {
                            Image(systemName: "shuffle")
                                .foregroundColor(.green)
                            Text("Zufallsmodus")
                        }
                    }
                }
                
                // Vocabulary Management Section
                Section(header: Text("Vokabelverwaltung")) {
                    Button(action: { showAddVocabulary = true }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.blue)
                            Text("Vokabeln hinzufügen")
                                .foregroundColor(.primary)
                        }
                    }
                    
                    Button(action: { showResetAlert = true }) {
                        HStack {
                            Image(systemName: "arrow.counterclockwise.circle.fill")
                                .foregroundColor(.orange)
                            Text("Lernstatus zurücksetzen")
                                .foregroundColor(.primary)
                        }
                    }
                }
                
                // Statistics Section
                Section(header: Text("Statistik")) {
                    HStack {
                        Text("Gelernte Vokabeln")
                        Spacer()
                        Text("\(vocabularyManager.getLearnedCount()) / \(vocabularyManager.getTotalCount())")
                            .foregroundColor(.secondary)
                    }
                    
                    if vocabularyManager.getTotalCount() > 0 {
                        let percentage = Double(vocabularyManager.getLearnedCount()) / Double(vocabularyManager.getTotalCount()) * 100
                        HStack {
                            Text("Fortschritt")
                            Spacer()
                            Text(String(format: "%.1f%%", percentage))
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                // Vocabulary List Section
                Section(header: Text("Vokabelliste")) {
                    ForEach(vocabularyManager.vocabularyItems) { vocab in
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(vocab.english)
                                    .font(.body)
                                Text(vocab.german)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            if vocab.isLearned {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Einstellungen")
            .sheet(isPresented: $showAddVocabulary) {
                AddVocabularyView()
            }
            .alert("Lernstatus zurücksetzen", isPresented: $showResetAlert) {
                Button("Abbrechen", role: .cancel) { }
                Button("Zurücksetzen", role: .destructive) {
                    vocabularyManager.resetLearningStatus()
                }
            } message: {
                Text("Möchtest du den Lernstatus aller Vokabeln zurücksetzen? Diese Aktion kann nicht rückgängig gemacht werden.")
            }
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(VocabularyManager())
}
