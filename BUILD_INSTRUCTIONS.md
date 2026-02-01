# Build Instructions

## Prerequisites

- macOS with Xcode 16.4 or later
- iOS Simulator or physical iPhone running iOS 18.5+
- Apple Developer account (for device deployment)

## Opening the Project

1. Navigate to the project directory:
   ```bash
   cd /Users/christian/Documents/Code-Projects/Apple-OS/Englisch-Vokabel-Trainer
   ```

2. Open the Xcode project:
   ```bash
   open Englisch-Vokabel-Trainer.xcodeproj
   ```

   Or double-click `Englisch-Vokabel-Trainer.xcodeproj` in Finder.

## Building the App

### In Xcode

1. **Select Target Device**
   - Click the device selector in the toolbar (next to the scheme)
   - Choose an iOS Simulator (e.g., iPhone 15 Pro)
   - Or connect a physical iPhone and select it

2. **Build and Run**
   - Press `⌘ + R` (Command + R)
   - Or click the Play button (▶) in the toolbar
   - Wait for the build to complete

3. **First Build**
   - The first build may take a few moments
   - Xcode will compile all Swift files
   - The app will launch automatically

### Using Command Line

```bash
# Build for simulator
xcodebuild -project Englisch-Vokabel-Trainer.xcodeproj \
           -scheme Englisch-Vokabel-Trainer \
           -destination 'platform=iOS Simulator,name=iPhone 15 Pro' \
           build

# Run on simulator
xcodebuild -project Englisch-Vokabel-Trainer.xcodeproj \
           -scheme Englisch-Vokabel-Trainer \
           -destination 'platform=iOS Simulator,name=iPhone 15 Pro' \
           test
```

## Project Structure Verification

The project uses Xcode's automatic file synchronization (PBXFileSystemSynchronizedRootGroup). All files in the `Englisch-Vokabel-Trainer/` directory are automatically included.

Verify all files are present:

```bash
find Englisch-Vokabel-Trainer -name "*.swift" -o -name "vocab_seed.json"
```

Expected files:
- ✅ Englisch_Vokabel_TrainerApp.swift
- ✅ ContentView.swift
- ✅ LearningView.swift
- ✅ SettingsView.swift
- ✅ AddVocabularyView.swift
- ✅ VocabularyItem.swift
- ✅ VocabularyManager.swift
- ✅ vocab_seed.json

## Troubleshooting

### Build Errors

**Error: "No such module 'SwiftUI'"**
- Solution: Ensure you're building for iOS 18.5+ target
- Check: Build Settings → iOS Deployment Target

**Error: "Cannot find 'vocab_seed.json' in scope"**
- Solution: Clean build folder (⌘ + Shift + K)
- Rebuild the project (⌘ + B)

**Error: "Development Team not set"**
- Solution: 
  1. Select the project in Project Navigator
  2. Select the target "Englisch-Vokabel-Trainer"
  3. Go to "Signing & Capabilities"
  4. Select your Team from the dropdown

### Runtime Issues

**App crashes on launch**
- Check Console for error messages
- Verify vocab_seed.json is valid JSON
- Check that all @EnvironmentObject dependencies are provided

**Vocabulary not loading**
- Check if vocab_seed.json is in the app bundle
- Verify JSON structure matches VocabularyItem model
- Check Documents directory permissions

**Dark mode not working**
- Verify @AppStorage("isDarkMode") is set to true
- Check preferredColorScheme modifier in app entry point

## Testing on Physical Device

1. **Connect iPhone** via USB

2. **Trust Computer** on iPhone if prompted

3. **Select Device** in Xcode device selector

4. **Configure Signing**
   - Project Settings → Signing & Capabilities
   - Enable "Automatically manage signing"
   - Select your Team

5. **Build and Run** (⌘ + R)

6. **Trust Developer** on iPhone
   - Settings → General → VPN & Device Management
   - Trust your developer certificate

## Editing Vocabulary

### Before Building

Edit `Englisch-Vokabel-Trainer/vocab_seed.json` to add/modify vocabulary:

```json
{
  "id": "UNIQUE-UUID-HERE",
  "english": "example",
  "german": "Beispiel",
  "syllables": [["ex", "am", "ple"]],
  "isLearned": false
}
```

### After Building

Use the in-app "Vokabeln hinzufügen" feature in Settings.

## Debugging

### Enable Debug Logging

Add print statements in VocabularyManager.swift:

```swift
func loadVocabulary() {
    print("📚 Loading vocabulary...")
    // existing code
    print("✅ Loaded \(vocabularyItems.count) items")
}
```

### View Console Output

- In Xcode: View → Debug Area → Activate Console (⌘ + Shift + C)
- Watch for print statements and error messages

### Inspect App Data

```bash
# Find app container (simulator)
xcrun simctl get_app_container booted Pen---Paper.Englisch-Vokabel-Trainer data

# View vocabulary.json
cat "$(xcrun simctl get_app_container booted Pen---Paper.Englisch-Vokabel-Trainer data)/Documents/vocabulary.json"
```

## Performance Optimization

The app is optimized for:
- Fast vocabulary loading (< 100ms)
- Smooth syllable rendering
- Instant persistence (saves immediately on changes)
- Minimal memory footprint

## Clean Build

If you encounter persistent issues:

```bash
# Clean build folder
rm -rf ~/Library/Developer/Xcode/DerivedData/Englisch-Vokabel-Trainer-*

# Or in Xcode
# Product → Clean Build Folder (⌘ + Shift + K)
```

## App Size

Expected app size:
- Debug build: ~2-3 MB
- Release build: ~1-2 MB
- Vocabulary data: ~15 KB

## Deployment

### TestFlight Distribution

1. Archive the app (Product → Archive)
2. Upload to App Store Connect
3. Add to TestFlight
4. Invite testers via email

### Ad Hoc Distribution

1. Archive the app
2. Export with Ad Hoc provisioning
3. Share .ipa file with testers
4. Install via Xcode or Apple Configurator

## Next Steps After Building

1. ✅ Verify app launches successfully
2. ✅ Test learning flow
3. ✅ Test syllable separation toggle
4. ✅ Test shuffle mode
5. ✅ Test adding vocabulary
6. ✅ Test reset functionality
7. ✅ Test dark/light mode toggle
8. ✅ Verify data persistence (close and reopen app)

## Support

For issues or questions:
- Check console logs for error messages
- Verify all files are present
- Ensure iOS deployment target is correct
- Clean and rebuild if needed

## Version Information

- **Project**: Englisch-Vokabel-Trainer
- **Bundle ID**: Pen---Paper.Englisch-Vokabel-Trainer
- **Version**: 1.0
- **Build**: 1
- **iOS Target**: 18.5+
- **Swift Version**: 5.0
- **Xcode Version**: 16.4+
