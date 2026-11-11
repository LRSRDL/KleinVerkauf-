# KleinVerkauf

Native iOS-App, um Verkaufsanzeigen für gebrauchte Kleinartikel vorzubereiten. Die App erzeugt einen bearbeitbaren Entwurf mit Fotos, Mängeln und begründetem Preis. Nach einer Bestätigung überträgt der Nutzer Text und Fotos selbst in die Kleinanzeigen-App; KleinVerkauf meldet sich nirgends an und veröffentlicht nichts automatisch.

## Auf dem iPad starten (Swift Playgrounds)

1. [Swift Playgrounds](https://apps.apple.com/app/id908519492) aus dem App Store installieren oder aktualisieren.
2. Auf GitHub im Repo auf **Code → Download ZIP** tippen und die Datei in „Dateien“ sichern.
3. Die ZIP-Datei in „Dateien“ antippen, damit sie entpackt wird.
4. Im entpackten Ordner `KleinVerkauf.swiftpm` antippen. Es öffnet sich in Swift Playgrounds.
5. Oben auf ▶︎ tippen, um die App zu starten.

Für eine neue Version die Schritte 2 bis 4 wiederholen.

## Bauen und testen

Bei jedem Push und Pull Request baut GitHub Actions auf einem Mac die App, das Playgrounds-Paket und führt die Tests aus (siehe `.github/workflows/ci.yml`). Ein eigener Mac ist nicht nötig.

Mit Xcode lokal:

```sh
xcodebuild test \
  -project KleinVerkauf.xcodeproj \
  -scheme KleinVerkauf \
  -destination 'platform=iOS Simulator,name=iPhone 16'
```

## Aufbau

| Ordner | Inhalt |
| --- | --- |
| `KleinVerkauf.swiftpm` | App-Paket für Swift Playgrounds, enthält den gesamten App-Code |
| `KleinVerkauf.swiftpm/App/Models` | SwiftData-Modelle: Artikel, Mangel, Foto, Anzeigenentwurf |
| `KleinVerkauf.swiftpm/App/Services` | Service-Protokolle und Wertkopien für testbare Logik |
| `KleinVerkauf.swiftpm/App/Views` | SwiftUI-Ansichten |
| `KleinVerkauf.xcodeproj` | Xcode-Projekt für Tests, nutzt denselben Code aus `KleinVerkauf.swiftpm/App` |
| `KleinVerkaufTests` | Tests mit Swift Testing |

Spezifikation und Regeln stehen in [`CLAUDE.md`](CLAUDE.md).
