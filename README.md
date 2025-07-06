cat <<EOF > README.md
# 🚀 Provider Clean Architecture Flutter Template

A clean, modular, and scalable Flutter project template using \`provider\` and clean architecture best practices.

## 📁 Folder Structure

\`\`\`
lib/
├── core/                   # Shared utilities, constants, base classes
├── features/               # Feature-first modules
│   └── auth/               # Example feature: Auth
│       ├── data/           # Data sources, models, repositories
│       ├── domain/         # Use cases, entities, abstract repositories
│       └── presentation/   # UI widgets, screens, state
├── main.dart               # App entry point
\`\`\`

## 🛠 Built With

- [Flutter](https://flutter.dev)
- [Provider](https://pub.dev/packages/provider)
- Clean Architecture
- Modular structure for scalability

## ⚙️ Getting Started

1. Install Flutter: https://flutter.dev/docs/get-started/install
2. Get packages:

\`\`\`bash
flutter pub get
\`\`\`

3. Run the app:

\`\`\`bash
flutter run
\`\`\`

---

## 💡 Using the Template Generator Tool

To create a new project from this template:

\`\`\`bash
python flutter_template_generator.py
\`\`\`

The tool will:
- Ask for the path to the template
- Ask for your new project name
- Create a copy with updated:
   - Project name
   - Android package name
   - iOS bundle identifier
- Remove \`.git\` so you can start fresh

---

## 📌 Notes

- Android uses **Kotlin DSL (\`.gradle.kts\`)**
- iOS settings are updated in both \`Info.plist\` and \`project.pbxproj\`
- Import paths are relative, so no need to refactor them

---

## 📄 License

This template is free and open-source. Use it in personal or commercial projects.

---

Created with ❤️ by [khaled mortaja]
EOF
