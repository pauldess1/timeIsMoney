# Time Is Money

> *See the real cost of things—in hours, minutes, and seconds.*

A beautiful Flutter app that transforms how you think about money by translating prices into the actual time you need to work to afford them.

---

## App Idea

**Time Is Money** answers a simple but powerful question: *"How many hours of my life do I need to work to buy this?"*

Instead of seeing a price tag as just a number, the app converts it into tangible time using your hourly wage. Want to buy a $50 coffee maker? Instantly see it costs 3 hours and 20 minutes of hard work. This perspective helps you make more intentional spending decisions.

### Key Features

✨ **Real-Time Calculation**  
Enter a price and instantly see the time cost at your configured hourly wage.

🕐 **Human-Readable Time Display**  
Results shown in days, hours, minutes, and seconds for intuitive understanding.

🎨 **Beautiful Dark UI**  
Sleek dark theme optimized for clarity and visual appeal.

⚙️ **Settings Panel**  
Customize your hourly wage to match your actual earning rate.

---

## Roadmap & Progress

### ✅ Stage 1: Core Calculation Engine
- [x] Build time metrics utility module (`lib/utils/time_metrics.dart`)
- [x] Implement seconds-based internal calculations
- [x] Create `secondsForPrice()` formula
- [x] Add `humanReadableFromSeconds()` for display formatting
- [x] Support days/hours/minutes/seconds breakdown
- [x] Separate business logic from UI layer

### ✅ Stage 2: User Interface Foundation
- [x] Create main app structure with Material Design
- [x] Build input TextField with currency icon
- [x] Implement real-time price input handling
- [x] Add title and descriptive text ("Worth it?")
- [x] Style with dark theme (#121212)
- [x] Configure numeric keyboard input type

### ✅ Stage 3: Layout & Positioning
- [x] Position settings button at bottom-left corner
- [x] Implement responsive layout with `Column` and `Row` widgets
- [x] Use `MainAxisAlignment.spaceBetween` for vertical spacing
- [x] Add visual dividers and spacing
- [x] Create nested layout structure for flexible positioning

### ✅ Stage 4: Typography & Alignment
- [x] Align price display and description text properly
- [x] Implement baseline alignment using `CrossAxisAlignment.baseline`
- [x] Fix font size mixing (30px + 18px on same line)
- [x] Polish typography hierarchy
- [x] Add conditional rendering (show cost only when price entered)
- [x] Display empty state with helpful placeholder

### 🔄 Stage 5: Settings & Personalization (In Progress)
- [ ] Create settings modal/screen
- [ ] Allow users to customize hourly wage
- [ ] Persist settings to local storage (SharedPreferences)
- [ ] Add support for multiple currencies

### 🚀 Stage 6: Advanced Features (Planned)
- [ ] Time comparison (e.g., "That's equivalent to watching X movies")
- [ ] Spending history tracker
- [ ] Monthly/yearly savings calculator
- [ ] Widget for homescreen quick access
- [ ] Dark/Light theme toggle

### 🌍 Stage 7: Distribution (Planned)
- [ ] iOS App Store release
- [ ] Google Play Store release
- [ ] Web version
- [ ] Desktop versions (Windows, macOS, Linux)

---

## 📦 Project Structure

```
lib/
├── main.dart              # Main app entry point & UI
└── utils/
    └── time_metrics.dart  # Core calculation logic

pubspec.yaml             # Project dependencies
README.md                # This file
```

## Tech Stack

- **Framework:** Flutter
- **Language:** Dart
- **Architecture:** Simple stateful widgets with utility separation
- **Supported Platforms:** iOS, Android, Web, Windows, macOS, Linux

---

## Getting Started

### Prerequisites
- Flutter SDK installed ([Download](https://flutter.dev/docs/get-started/install))
- Dart SDK (included with Flutter)

### Installation

```bash
# Clone the repository
cd time_is_money

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Configuration

To change the default hourly wage, edit `lib/main.dart`:

```dart
final double hourlyWage = 15.0; // Change this value to your actual hourly wage
```

---

## How It Works

### Example Flow

1. **User enters a price** (e.g., `$50`)
2. **App calculates seconds** 
   - With hourly wage = $15
   - Result: `50 × 3600 / 15 = 12,000 seconds`
3. **System breaks it down** into readable units
   - `3h 20m` (3 hours and 20 minutes)
4. **Display shows:**
   ```
   3h 20m of hard work
   ```

### Scenario Example

**You earn $15/hour and want to buy a $30 item:**

- Input: `30`
- Calculation: `30 × 3600 / 15 = 7200 seconds`
- Display: `2h of hard work`
- Insight: That purchase requires 2 hours of work.

---

## Design Philosophy

**Minimalist & Intentional**  
Clean dark UI reduces cognitive load and emphasizes the core value proposition.

**Real-Time Feedback**  
Instant calculations encourage exploration and reflection.

**Accessibility First**  
Large text, high contrast, and clear spacing ensure usability for all.

**Metric Clarity**  
All internal calculations use seconds (single source of truth), with conversion to display units happening at presentation layer.

---

## Contributing

Ideas and feedback welcome! Feel free to:
- Open issues for bugs or feature requests
- Suggest improvements to the algorithm or UI
- Submit pull requests

---

## Philosophy

*"Time is the most valuable currency nobody wants to quantify."*

Time Is Money exists to make that quantification simple, visual, and actionable. Because the best financial decision is one made with full awareness of its time cost.

Every dollar spent is an hour of your life. Know the price.

---

**Made with ❤️ to help you spend your time—and money—wisely.**
