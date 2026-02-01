# App Overview - Englisch-Vokabel-Trainer

## App Structure

```
┌─────────────────────────────────────┐
│   Englisch_Vokabel_TrainerApp       │
│   (App Entry Point)                 │
│   - Dark Mode Support               │
│   - VocabularyManager Injection     │
└─────────────────────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────┐
│          ContentView                │
│          (Tab Navigation)           │
└─────────────────────────────────────┘
          │                  │
          ▼                  ▼
┌──────────────────┐  ┌──────────────────┐
│  LearningView    │  │  SettingsView    │
│  (Tab 1)         │  │  (Tab 2)         │
└──────────────────┘  └──────────────────┘
                               │
                               ▼
                      ┌──────────────────┐
                      │ AddVocabularyView│
                      │ (Sheet)          │
                      └──────────────────┘
```

## Data Flow

```
┌──────────────────────────────────────────┐
│         VocabularyManager                │
│         (ObservableObject)               │
│                                          │
│  - vocabularyItems: [VocabularyItem]    │
│  - currentIndex: Int                     │
│  - shuffleMode: Bool                     │
│  - shuffledIndices: [Int]               │
│                                          │
│  Methods:                                │
│  - loadVocabulary()                     │
│  - saveVocabulary()                     │
│  - nextVocabulary()                     │
│  - markCurrentAsLearned()               │
│  - resetLearningStatus()                │
│  - addVocabulary(...)                   │
└──────────────────────────────────────────┘
              │
              ▼
┌──────────────────────────────────────────┐
│      Local JSON Persistence              │
│                                          │
│  Bundle:                                 │
│  vocab_seed.json (read-only)            │
│                                          │
│  Documents Directory:                    │
│  vocabulary.json (read/write)           │
└──────────────────────────────────────────┘
```

## User Flow

### Learning Flow
```
1. App Launch
   ↓
2. LearningView shows first vocabulary
   - English word displayed (with/without syllables)
   - Progress indicator (X / Y)
   ↓
3. User clicks "Übersetzung anzeigen"
   ↓
4. German translation appears
   - "Nächste Vokabel →" button appears
   ↓
5. User can:
   a) Click "✔ Gewusst" → mark as learned + next
   b) Click "Nächste Vokabel →" → next without marking
   ↓
6. Repeat from step 2
```

### Settings Flow
```
1. User taps Settings tab
   ↓
2. Settings options:
   - Toggle Dark Mode
   - Toggle Syllable Separation
   - Toggle Shuffle Mode
   - Add Vocabulary (opens sheet)
   - Reset Learning Status (shows alert)
   ↓
3. View Statistics:
   - Learned count / Total count
   - Progress percentage
   ↓
4. Browse Vocabulary List:
   - All vocabulary items
   - Checkmark for learned items
```

## Key Features Implementation

### Syllable Separation
```swift
// Data structure supports multi-word entries
syllables: [[String]]
// Example: "to fall asleep"
[["to"], ["fall"], ["a", "sleep"]]

// Rendering logic
- If showSyllables = true:
  * Each syllable gets color (blue/red/purple)
  * Hyphens shown between syllables
  * Spaces shown between words
- If showSyllables = false:
  * Plain text rendering
```

### Shuffle Logic
```
1. When shuffle mode enabled:
   - Get all unlearned vocabulary indices
   - If none unlearned, use all vocabulary
   - Shuffle the indices
   
2. During learning:
   - Use shuffledIndices[currentIndex]
   - When cycle complete, create new shuffle
   
3. When marking as learned:
   - Update vocabulary item
   - Continue with current shuffle cycle
```

### Persistence Strategy
```
First Launch:
1. Check if vocabulary.json exists in Documents
2. If not, copy vocab_seed.json from Bundle
3. Load into memory

Subsequent Launches:
1. Load vocabulary.json from Documents
2. Seed file remains unchanged (backup)

On Changes:
1. Update in-memory vocabularyItems
2. Save to vocabulary.json immediately
```

## AppStorage Keys

```swift
@AppStorage("isDarkMode") 
// Default: true
// Scope: Global app appearance

@AppStorage("showSyllables")
// Default: false
// Scope: Learning view syllable rendering
```

## Color Scheme

### Syllable Colors (LRS-friendly)
- Syllable 1: **Blue** (#0000FF)
- Syllable 2: **Red** (#FF0000)
- Syllable 3: **Purple** (#800080)
- Pattern repeats for 4+ syllables

### UI Colors
- Primary Action: **Blue** (Übersetzung anzeigen, Nächste Vokabel)
- Success Action: **Green** (✔ Gewusst)
- Warning Action: **Orange** (Reset)
- Secondary Text: **Gray**

## File Responsibilities

| File | Purpose |
|------|---------|
| `Englisch_Vokabel_TrainerApp.swift` | App entry, dark mode, dependency injection |
| `ContentView.swift` | Tab navigation between Learning and Settings |
| `LearningView.swift` | Main learning interface with syllable rendering |
| `SettingsView.swift` | Settings, toggles, vocabulary list, statistics |
| `AddVocabularyView.swift` | Form for manual vocabulary entry |
| `VocabularyItem.swift` | Data model definition |
| `VocabularyManager.swift` | Business logic, persistence, shuffle |
| `vocab_seed.json` | Initial vocabulary data (90+ items) |

## Testing Checklist

- [ ] App launches successfully
- [ ] Dark mode is enabled by default
- [ ] Vocabulary loads from seed file on first launch
- [ ] Learning view displays vocabulary correctly
- [ ] Syllable separation toggle works
- [ ] Color-coded syllables render correctly
- [ ] Hyphens appear only when syllables enabled
- [ ] Translation reveal works
- [ ] Next vocabulary navigation works
- [ ] Mark as learned works and persists
- [ ] Shuffle mode randomizes unlearned items
- [ ] Add vocabulary form validates input
- [ ] Syllable parsing works correctly
- [ ] Reset learning status clears all flags
- [ ] Statistics display correctly
- [ ] Vocabulary list shows all items
- [ ] Dark/Light mode toggle works
- [ ] Data persists between app launches

## Future Enhancement Ideas

- [ ] Audio pronunciation support
- [ ] Spaced repetition algorithm
- [ ] Multiple vocabulary sets/chapters
- [ ] Import/export vocabulary
- [ ] Progress charts and analytics
- [ ] Achievements and rewards
- [ ] Parent/teacher dashboard
- [ ] Offline speech recognition
- [ ] Custom syllable color schemes
- [ ] Font size adjustment
