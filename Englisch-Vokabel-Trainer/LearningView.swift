//
//  LearningView.swift
//  Englisch-Vokabel-Trainer
//
//  Main learning interface with syllable separation support
//

import SwiftUI

struct LearningView: View {
    @EnvironmentObject var vocabularyManager: VocabularyManager
    @AppStorage("showSyllables") private var showSyllables: Bool = false
    
    @State private var showTranslation: Bool = false
    
    // LRS-friendly syllable colors
    private let syllableColors: [Color] = [.blue, .red, .purple]
    
    var body: some View {
        VStack(spacing: 0) {
            // Progress indicator
            HStack {
                Text("\(vocabularyManager.getLearnedCount()) / \(vocabularyManager.getTotalCount())")
                    .font(.headline)
                    .foregroundColor(.secondary)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            Spacer()
            
            // Main vocabulary display (centered)
            if let currentVocab = vocabularyManager.getCurrentVocabulary() {
                VStack(spacing: 20) {
                    // English word with syllable separation
                    renderEnglishText(currentVocab)
                        .font(.system(size: 32, weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    // German translation (shown when revealed)
                    if showTranslation {
                        Text(currentVocab.german)
                            .font(.system(size: 28))
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                }
            } else {
                Text("Keine Vokabeln verfügbar")
                    .font(.title2)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            // Bottom buttons (fixed position)
            if vocabularyManager.getCurrentVocabulary() != nil {
                VStack(spacing: 12) {
                    // Blue button: "Übersetzung anzeigen" or "Nächste Vokabel"
                    if showTranslation {
                        Button(action: nextVocabulary) {
                            HStack {
                                Text("Nächste Vokabel")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                Image(systemName: "arrow.right")
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                        }
                    } else {
                        Button(action: { showTranslation = true }) {
                            Text("Übersetzung anzeigen")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                    }
                    
                    // Green button: "Gewusst"
                    Button(action: markAsLearned) {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                            Text("Gewusst")
                                .font(.title3)
                                .fontWeight(.semibold)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
        }
        .onChange(of: vocabularyManager.currentIndex) { _ in
            showTranslation = false
        }
    }
    
    // MARK: - Syllable Rendering
    
    @ViewBuilder
    private func renderEnglishText(_ vocab: VocabularyItem) -> some View {
        if showSyllables {
            // Render with syllable separation
            VStack(spacing: 8) {
                ForEach(vocab.syllables.indices, id: \.self) { wordIndex in
                    renderWord(vocab.syllables[wordIndex])
                }
            }
        } else {
            // Render plain text
            Text(vocab.english)
        }
    }
    
    @ViewBuilder
    private func renderWord(_ wordSyllables: [String]) -> some View {
        HStack(spacing: showSyllables ? 4 : 0) {
            ForEach(wordSyllables.indices, id: \.self) { index in
                Text(wordSyllables[index])
                    .foregroundColor(syllableColors[index % syllableColors.count])
                
                // Show hyphen between syllables (only when syllable mode is on)
                if showSyllables && index < wordSyllables.count - 1 {
                    Text("-")
                        .foregroundColor(.secondary)
                }
            }
        }
    }
    
    // MARK: - Actions
    
    private func nextVocabulary() {
        vocabularyManager.nextVocabulary()
        showTranslation = false
    }
    
    private func markAsLearned() {
        vocabularyManager.markCurrentAsLearned()
        nextVocabulary()
    }
}

#Preview {
    LearningView()
        .environmentObject(VocabularyManager())
}
