# App Screens Overview

## 📱 Visual Layout Description

### 1. Learning View (Main Screen)

```
┌─────────────────────────────────────┐
│  ← Lernen        Einstellungen →    │
├─────────────────────────────────────┤
│                                     │
│  5 / 90                             │ ← Progress
│                                     │
│                                     │
│                                     │
│                                     │
│          ba-na-na                   │ ← English word
│       (blue-red-purple)             │   with syllables
│                                     │
│                                     │
│                                     │
│  ┌─────────────────────────────┐   │
│  │  Übersetzung anzeigen       │   │ ← Show translation
│  └─────────────────────────────┘   │   button
│                                     │
│                                     │
│                                     │
│                                     │
│  ┌─────────────────────────────┐   │
│  │  ✔ Gewusst                  │   │ ← Mark as learned
│  └─────────────────────────────┘   │   button
│                                     │
└─────────────────────────────────────┘
```

**After clicking "Übersetzung anzeigen":**

```
┌─────────────────────────────────────┐
│  ← Lernen        Einstellungen →    │
├─────────────────────────────────────┤
│                                     │
│  5 / 90                             │
│                                     │
│                                     │
│          ba-na-na                   │ ← English word
│       (blue-red-purple)             │
│                                     │
│          Banane                     │ ← German translation
│                                     │
│                                     │
│  ┌─────────────────────────────┐   │
│  │  Nächste Vokabel →          │   │ ← Next vocabulary
│  └─────────────────────────────┘   │   button
│                                     │
│                                     │
│  ┌─────────────────────────────┐   │
│  │  ✔ Gewusst                  │   │
│  └─────────────────────────────┘   │
│                                     │
└─────────────────────────────────────┘
```

---

### 2. Settings View

```
┌─────────────────────────────────────┐
│  ← Lernen        Einstellungen →    │
├─────────────────────────────────────┤
│                                     │
│  Darstellung                        │
│  ┌─────────────────────────────┐   │
│  │ 🌙 Dark Mode          [ON]  │   │
│  ├─────────────────────────────┤   │
│  │ 📝 Silbentrennung     [OFF] │   │
│  └─────────────────────────────┘   │
│                                     │
│  Lerneinstellungen                  │
│  ┌─────────────────────────────┐   │
│  │ 🔀 Zufallsmodus       [OFF] │   │
│  └─────────────────────────────┘   │
│                                     │
│  Vokabelverwaltung                  │
│  ┌─────────────────────────────┐   │
│  │ ➕ Vokabeln hinzufügen      │   │
│  ├─────────────────────────────┤   │
│  │ 🔄 Lernstatus zurücksetzen  │   │
│  └─────────────────────────────┘   │
│                                     │
│  Statistik                          │
│  ┌─────────────────────────────┐   │
│  │ Gelernte Vokabeln    5 / 90 │   │
│  ├─────────────────────────────┤   │
│  │ Fortschritt          5.6%   │   │
│  └─────────────────────────────┘   │
│                                     │
│  Vokabelliste                       │
│  ┌─────────────────────────────┐   │
│  │ banana                      │   │
│  │ Banane                  ✓   │   │
│  ├─────────────────────────────┤   │
│  │ shoe                        │   │
│  │ Schuh                       │   │
│  ├─────────────────────────────┤   │
│  │ glasses                     │   │
│  │ Brille                      │   │
│  └─────────────────────────────┘   │
│                                     │
└─────────────────────────────────────┘
```

---

### 3. Add Vocabulary View (Sheet)

```
┌─────────────────────────────────────┐
│  Abbrechen  Vokabel hinzufügen  ✓  │
├─────────────────────────────────────┤
│                                     │
│  Vokabel                            │
│  ┌─────────────────────────────┐   │
│  │ Englisch: _____________     │   │
│  ├─────────────────────────────┤   │
│  │ Deutsch: ______________     │   │
│  └─────────────────────────────┘   │
│                                     │
│  Silbentrennung                     │
│  ┌─────────────────────────────┐   │
│  │ z.B. ba-na-na oder          │   │
│  │ to get up                   │   │
│  │ _______________________     │   │
│  └─────────────────────────────┘   │
│                                     │
│  Verwende '-' für Silbentrennung    │
│  innerhalb eines Wortes und         │
│  Leerzeichen zwischen Wörtern.      │
│                                     │
│  Beispiele                          │
│  ┌─────────────────────────────┐   │
│  │ banana → ba-na-na           │   │
│  │ to fall asleep → to fall    │   │
│  │                  a-sleep    │   │
│  │ glasses → glas-ses          │   │
│  └─────────────────────────────┘   │
│                                     │
└─────────────────────────────────────┘
```

---

## 🎨 Color Scheme

### Syllable Colors (LRS-Friendly)
```
Syllable 1: 🔵 Blue   (#0000FF)
Syllable 2: 🔴 Red    (#FF0000)
Syllable 3: 🟣 Purple (#800080)
```

### Example: "banana"
```
ba  -  na  -  na
🔵     🔴     🟣
```

### Example: "to fall asleep"
```
to    fall    a  -  sleep
🔵    🔴      🟣     🔵
```

### Example: "It gets on my nerves"
```
It    gets    on    my    ner  -  ves
🔵    🔴      🟣    🔵    🔴       🟣
```

---

## 🎯 Button Colors

```
Primary (Blue):    Übersetzung anzeigen, Nächste Vokabel
Success (Green):   ✔ Gewusst
Warning (Orange):  Lernstatus zurücksetzen
Info (Blue):       Vokabeln hinzufügen
```

---

## 📐 Layout Specifications

### Learning View
- **Vocabulary font**: 32pt, Bold
- **Translation font**: 28pt, Regular
- **Button font**: Title3 (20pt), Semibold
- **Spacing**: 30-40pt between elements
- **Button height**: ~50pt
- **Padding**: 20pt horizontal

### Settings View
- **Section headers**: Default system style
- **List items**: Default system style
- **Toggle switches**: System default
- **Icons**: 20pt SF Symbols

### Typography Hierarchy
```
1. Vocabulary Word:  32pt Bold    (Most important)
2. Translation:      28pt Regular (Secondary)
3. Buttons:          20pt Semibold (Actions)
4. Progress:         17pt Regular (Info)
5. Captions:         12pt Regular (Help text)
```

---

## 🌓 Dark Mode vs Light Mode

### Dark Mode (Default)
```
Background:  Black (#000000)
Text:        White (#FFFFFF)
Secondary:   Gray  (#8E8E93)
Buttons:     Colored (Blue, Green, Orange)
```

### Light Mode
```
Background:  White (#FFFFFF)
Text:        Black (#000000)
Secondary:   Gray  (#8E8E93)
Buttons:     Colored (Blue, Green, Orange)
```

**Note**: Syllable colors remain the same in both modes for consistency.

---

## 📱 Navigation

### Tab Bar (Bottom)
```
┌─────────────────────────────────────┐
│                                     │
│         [Content Area]              │
│                                     │
├─────────────────────────────────────┤
│  📚 Lernen    ⚙️ Einstellungen      │
└─────────────────────────────────────┘
```

### Tab 1: Lernen (Learning)
- Icon: 📚 book.fill
- Default selected
- Shows LearningView

### Tab 2: Einstellungen (Settings)
- Icon: ⚙️ gear
- Shows SettingsView
- Can open AddVocabularyView sheet

---

## 🎬 User Flow Animation

### Learning Flow
```
1. [English Word]
   ↓ tap "Übersetzung anzeigen"
2. [English Word + German Translation]
   ↓ tap "✔ Gewusst"
3. [Next English Word]
   ↓ repeat
```

### Settings Flow
```
1. [Settings List]
   ↓ tap "Vokabeln hinzufügen"
2. [Add Vocabulary Sheet]
   ↓ fill form & tap "Hinzufügen"
3. [Settings List] (updated)
```

---

## 📊 Progress Indicators

### Learning View
```
5 / 90  ← Top left corner
```

### Settings View
```
Gelernte Vokabeln    5 / 90
Fortschritt          5.6%
```

### Vocabulary List
```
banana
Banane                  ✓  ← Checkmark for learned
```

---

## 🎨 Visual Design Principles

### 1. Clarity
- Large, readable fonts
- High contrast colors
- Generous spacing
- One task at a time

### 2. Simplicity
- Minimal UI elements
- Clear button labels
- No distractions
- Focused content

### 3. Consistency
- Same colors throughout
- Predictable navigation
- Standard iOS patterns
- Familiar interactions

### 4. Accessibility
- LRS-friendly colors
- Large tap targets
- Clear typography
- Dark mode support

---

## 💡 Design Notes

### Why These Colors?
- **Blue, Red, Purple**: High contrast, easy to distinguish
- **Not Green**: Can be confused with blue for some dyslexics
- **Not Yellow**: Low contrast, hard to read

### Why Large Fonts?
- Easier to read for children with dyslexia
- Reduces eye strain
- Improves focus
- Better for learning

### Why Dark Mode Default?
- Reduces eye strain
- Better for extended use
- Popular with students
- Modern aesthetic

### Why No Scrolling in Learning?
- Maintains focus
- Reduces distraction
- One vocabulary at a time
- Clear task completion

---

## 🎯 Target Audience Considerations

### Children with Dyslexia (LRS)
- ✅ Color-coded syllables
- ✅ Clear visual separation
- ✅ Large, readable fonts
- ✅ No time pressure
- ✅ Self-paced learning

### Age 10-12 (Grade 5)
- ✅ Simple, intuitive interface
- ✅ Motivating progress tracking
- ✅ Immediate feedback
- ✅ Fun color scheme
- ✅ Achievement feeling

---

## 📱 Screen Sizes Supported

The app uses SwiftUI's adaptive layout and works on:
- **iPhone SE** (small)
- **iPhone 15** (standard)
- **iPhone 15 Pro Max** (large)
- **iPad** (with larger fonts)

All layouts scale appropriately using:
- `.frame(maxWidth: .infinity)` for buttons
- `.padding()` for spacing
- System fonts for text
- Adaptive colors for themes

---

This visual overview helps understand the app's design and layout without needing to build it first!
