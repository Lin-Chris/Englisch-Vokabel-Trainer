//
//  AddVocabularyView.swift
//  Englisch-Vokabel-Trainer
//
//  Form for manually adding new vocabulary items
//

import SwiftUI

struct AddVocabularyView: View {
    @EnvironmentObject var vocabularyManager: VocabularyManager
    @Environment(\.dismiss) var dismiss
    
    @State private var english: String = ""
    @State private var german: String = ""
    @State private var syllableInput: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Vokabel")) {
                    TextField("Englisch", text: $english)
                        .autocapitalization(.none)
                    
                    TextField("Deutsch", text: $german)
                        .autocapitalization(.none)
                }
                
                Section(header: Text("Silbentrennung")) {
                    TextField("z.B. ba-na-na oder to get up", text: $syllableInput)
                        .autocapitalization(.none)
                    
                    Text("Verwende '-' für Silbentrennung innerhalb eines Wortes und Leerzeichen zwischen Wörtern.")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Section(header: Text("Beispiele")) {
                    VStack(alignment: .leading, spacing: 8) {
                        ExampleRow(english: "banana", syllables: "ba-na-na")
                        ExampleRow(english: "to fall asleep", syllables: "to fall a-sleep")
                        ExampleRow(english: "glasses", syllables: "glas-ses")
                    }
                    .font(.caption)
                }
            }
            .navigationTitle("Vokabel hinzufügen")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Abbrechen") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Hinzufügen") {
                        addVocabulary()
                    }
                    .disabled(english.isEmpty || german.isEmpty || syllableInput.isEmpty)
                }
            }
            .alert("Fehler", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    private func addVocabulary() {
        // Parse syllable input
        let syllables = parseSyllableInput(syllableInput)
        
        if syllables.isEmpty {
            alertMessage = "Bitte gib eine gültige Silbentrennung ein."
            showAlert = true
            return
        }
        
        // Add vocabulary
        vocabularyManager.addVocabulary(english: english, german: german, syllables: syllables)
        
        // Reset form
        english = ""
        german = ""
        syllableInput = ""
        
        dismiss()
    }
    
    private func parseSyllableInput(_ input: String) -> [[String]] {
        // Split by spaces to get individual words
        let words = input.split(separator: " ").map(String.init)
        
        var result: [[String]] = []
        
        for word in words {
            // Split each word by hyphens to get syllables
            let syllables = word.split(separator: "-").map(String.init)
            
            if !syllables.isEmpty {
                result.append(syllables)
            }
        }
        
        return result
    }
}

struct ExampleRow: View {
    let english: String
    let syllables: String
    
    var body: some View {
        HStack {
            Text(english)
                .foregroundColor(.primary)
            Image(systemName: "arrow.right")
                .foregroundColor(.secondary)
                .font(.caption2)
            Text(syllables)
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    AddVocabularyView()
        .environmentObject(VocabularyManager())
}
