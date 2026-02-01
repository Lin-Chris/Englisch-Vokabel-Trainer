//
//  VocabularyItem.swift
//  Englisch-Vokabel-Trainer
//
//  Data model for vocabulary items with syllable separation support
//

import Foundation

struct VocabularyItem: Identifiable, Codable {
    let id: UUID
    let english: String
    let german: String
    let syllables: [[String]]
    var isLearned: Bool
    
    init(id: UUID = UUID(), english: String, german: String, syllables: [[String]], isLearned: Bool = false) {
        self.id = id
        self.english = english
        self.german = german
        self.syllables = syllables
        self.isLearned = isLearned
    }
}
