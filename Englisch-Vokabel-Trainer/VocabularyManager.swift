//
//  VocabularyManager.swift
//  Englisch-Vokabel-Trainer
//
//  Manages vocabulary loading, persistence, and shuffle logic
//

import Foundation

class VocabularyManager: ObservableObject {
    @Published var vocabularyItems: [VocabularyItem] = []
    @Published var currentIndex: Int = 0
    @Published var shuffledIndices: [Int] = []
    @Published var shuffleMode: Bool = false {
        didSet {
            if shuffleMode {
                createNewShuffleCycle()
            } else {
                currentIndex = 0
            }
        }
    }
    
    private let vocabularyFileURL: URL
    private let seedFileName = "vocab_seed"
    
    init() {
        // Get documents directory for persistent storage
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        vocabularyFileURL = documentsPath.appendingPathComponent("vocabulary.json")
        
        loadVocabulary()
    }
    
    // MARK: - Loading and Persistence
    
    func loadVocabulary() {
        // Try to load from persistent storage first
        if FileManager.default.fileExists(atPath: vocabularyFileURL.path) {
            loadFromPersistentStorage()
        } else {
            // First launch: copy seed file to persistent storage
            loadFromSeedFile()
        }
        
        if shuffleMode {
            createNewShuffleCycle()
        }
    }
    
    private func loadFromPersistentStorage() {
        do {
            let data = try Data(contentsOf: vocabularyFileURL)
            vocabularyItems = try JSONDecoder().decode([VocabularyItem].self, from: data)
        } catch {
            print("Error loading vocabulary from persistent storage: \(error)")
            loadFromSeedFile()
        }
    }
    
    private func loadFromSeedFile() {
        guard let url = Bundle.main.url(forResource: seedFileName, withExtension: "json") else {
            print("Seed file not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            vocabularyItems = try JSONDecoder().decode([VocabularyItem].self, from: data)
            saveVocabulary()
        } catch {
            print("Error loading seed file: \(error)")
        }
    }
    
    func saveVocabulary() {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(vocabularyItems)
            try data.write(to: vocabularyFileURL)
        } catch {
            print("Error saving vocabulary: \(error)")
        }
    }
    
    // MARK: - Vocabulary Management
    
    func addVocabulary(english: String, german: String, syllables: [[String]]) {
        let newItem = VocabularyItem(english: english, german: german, syllables: syllables)
        vocabularyItems.append(newItem)
        saveVocabulary()
        
        if shuffleMode {
            createNewShuffleCycle()
        }
    }
    
    func markCurrentAsLearned() {
        guard !vocabularyItems.isEmpty else { return }
        
        let actualIndex = shuffleMode ? shuffledIndices[currentIndex] : currentIndex
        vocabularyItems[actualIndex].isLearned = true
        saveVocabulary()
        
        // If shuffle mode and all unlearned items are done, restart cycle
        if shuffleMode && currentIndex >= shuffledIndices.count - 1 {
            createNewShuffleCycle()
            currentIndex = 0
        }
    }
    
    func resetLearningStatus() {
        for index in vocabularyItems.indices {
            vocabularyItems[index].isLearned = false
        }
        saveVocabulary()
        currentIndex = 0
        
        if shuffleMode {
            createNewShuffleCycle()
        }
    }
    
    // MARK: - Navigation
    
    func nextVocabulary() {
        guard !vocabularyItems.isEmpty else { return }
        
        if shuffleMode {
            currentIndex = (currentIndex + 1) % shuffledIndices.count
            
            // If we've completed a cycle, create a new shuffle
            if currentIndex == 0 {
                createNewShuffleCycle()
            }
        } else {
            currentIndex = (currentIndex + 1) % vocabularyItems.count
        }
    }
    
    func getCurrentVocabulary() -> VocabularyItem? {
        guard !vocabularyItems.isEmpty else { return nil }
        
        if shuffleMode {
            guard !shuffledIndices.isEmpty else { return nil }
            return vocabularyItems[shuffledIndices[currentIndex]]
        } else {
            return vocabularyItems[currentIndex]
        }
    }
    
    // MARK: - Shuffle Logic
    
    private func createNewShuffleCycle() {
        // Get indices of unlearned vocabulary
        let unlearnedIndices = vocabularyItems.enumerated()
            .filter { !$0.element.isLearned }
            .map { $0.offset }
        
        // If all are learned, use all vocabulary
        if unlearnedIndices.isEmpty {
            shuffledIndices = Array(vocabularyItems.indices).shuffled()
        } else {
            shuffledIndices = unlearnedIndices.shuffled()
        }
    }
    
    // MARK: - Statistics
    
    func getLearnedCount() -> Int {
        vocabularyItems.filter { $0.isLearned }.count
    }
    
    func getTotalCount() -> Int {
        vocabularyItems.count
    }
}
