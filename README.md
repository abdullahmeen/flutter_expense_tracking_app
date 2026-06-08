# 💸 Expense Tracker App

A simple, beautiful, and responsive mobile application built with Flutter to help users track their personal expenses.

## ✨ Features
* **Add & Edit Expenses:** Input title, amount, date, category, and optional notes.
* **Smart Validation:** Prevents negative amounts and ensures required fields are filled.
* **Visual Summary:** Interactive pie chart displaying category-wise breakdown of spending.
* **History:** View all expenses sorted by the most recent date.
* **Dark Mode Support:** Automatically adapts to the user's system theme.

## 🛠️ Tech Stack & Libraries
* **Framework:** Flutter / Dart
* **State Management:** [Provider](https://pub.dev/packages/provider) (Clean separation of business logic and UI)
* **Charts:** [fl_chart](https://pub.dev/packages/fl_chart) for smooth, animated visualizations
* **Utilities:** `intl` (date formatting), `uuid` (unique ID generation)

## 📂 Project Structure
The app follows a clean architecture pattern to keep UI and logic separated:
```text
lib/
 ├── models/             # Data structures (expense.dart)
 ├── providers/          # State management & business logic (expense_provider.dart)
 ├── screens/            # Main UI pages (home_screen.dart, summary_screen.dart)
 ├── widgets/            # Reusable UI components (expense_form.dart)
 └── main.dart           # App entry point & theme configuration