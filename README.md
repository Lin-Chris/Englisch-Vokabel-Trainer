# Englisch-Vokabel-Trainer

An iOS vocabulary learning app designed specifically for children with dyslexia (LRS) aged 10-12, focusing on English vocabulary learning with phonological/syllable separation support.

## Features

### Learning Interface
- **One vocabulary item at a time** - focused learning experience
- **Syllable separation** - color-coded syllables (blue, red, purple) with optional hyphens
- **Self-paced learning** - reveal translation when ready
- **Progress tracking** - mark vocabulary as learned

### Pedagogical Support
- **Simplified didactic phonological separation** - helps children write words correctly
- **Visual syllable separation** - supports correct spelling for dyslexic learners
- **Color-coded syllables** - LRS-friendly color scheme
- **Optional hyphen separators** - shown only when syllable mode is enabled

### Settings & Management
- **Dark Mode** - enabled by default, toggleable
- **Syllable separation toggle** - turn phonological separation on/off
- **Shuffle mode** - randomize vocabulary order (focuses on unlearned items)
- **Add vocabulary** - manual entry with syllable separation
- **Reset learning status** - clear all learned flags
- **Vocabulary list** - scrollable list with progress indicators
- **Statistics** - track learned vocabulary count and percentage

## Technical Details

### Architecture
- **SwiftUI** - modern iOS UI framework
- **MVVM Pattern** - VocabularyManager as ObservableObject
- **Local persistence** - JSON-based storage in Documents directory
- **Seed file** - initial vocabulary loaded from bundle

### Data Model

```swift
struct VocabularyItem: Identifiable, Codable {
    let id: UUID
    let english: String
    let german: String
    let syllables: [[String]]  // Array of words, each word is array of syllables
    var isLearned: Bool
}
```

### Syllable Separation Rules
- Inspired by grammatikguru.de/silbentrennung-englisch/
- Adapted didactically for children with dyslexia
- Supports single words, phrases, and full sentences
- Per-word separation for multi-word entries

### Files Structure

```
Englisch-Vokabel-Trainer/
├── Englisch_Vokabel_TrainerApp.swift  # App entry point with dark mode
├── ContentView.swift                   # Tab navigation
├── LearningView.swift                  # Main learning interface
├── SettingsView.swift                  # Settings and management
├── AddVocabularyView.swift            # Manual vocabulary entry
├── VocabularyItem.swift               # Data model
├── VocabularyManager.swift            # Business logic and persistence
└── vocab_seed.json                    # Initial vocabulary (90+ items)
```

## Usage

### First Launch
On first launch, the app copies `vocab_seed.json` from the bundle to the Documents directory for persistent storage.

### Learning Flow
1. View English vocabulary with optional syllable separation
2. Click "Übersetzung anzeigen" to reveal German translation
3. Click "Nächste Vokabel →" to continue
4. Click "✔ Gewusst" to mark as learned and move to next

### Adding Vocabulary
1. Go to Settings tab
2. Click "Vokabeln hinzufügen"
3. Enter English word/phrase
4. Enter German translation
5. Enter syllable separation (use `-` for syllables, spaces for words)
   - Example: `ba-na-na`
   - Example: `to fall a-sleep`

### Shuffle Mode
- When enabled, shows only unlearned vocabulary in random order
- Each vocabulary appears once per cycle
- Automatically restarts when all items are shown

## Requirements

- iOS 18.5+
- Xcode 16.4+
- Swift 5.0+

## Language Convention

- **Code & comments**: English
- **UI text**: German
- **Vocabulary words**: English
- **Translations**: German (may start with lowercase for non-nouns)

## Design Principles

- **Clear typography** - large, readable fonts
- **Large buttons** - easy to tap
- **Minimal text per screen** - reduces cognitive load
- **Centered vocabulary display** - focused attention
- **No scrolling in learning view** - distraction-free
- **Dark mode default** - reduces eye strain

## Vocabulary Count

The app includes **90+ vocabulary items** covering:
- Common nouns (banana, shoe, glasses, etc.)
- Verbs and phrases (to fall asleep, to get up, etc.)
- Time expressions (o'clock, quarter past/to, etc.)
- Full sentences (It gets on my nerves!, etc.)

## License

Private educational project.
