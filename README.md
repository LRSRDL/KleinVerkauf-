# KleinVerkauf

Native iOS-App, um Verkaufsanzeigen für gebrauchte Kleinartikel vorzubereiten. Die App erzeugt einen bearbeitbaren Entwurf mit Fotos, Mängeln und begründetem Preis. Nach einer Bestätigung überträgt der Nutzer Text und Fotos selbst in die Kleinanzeigen-App; KleinVerkauf meldet sich nirgends an und veröffentlicht nichts automatisch.

## Voraussetzungen

- Xcode 16 oder neuer
- iOS 18 Simulator oder Gerät

## Bauen und testen

```sh
xcodebuild test \
  -project KleinVerkauf.xcodeproj \
  -scheme KleinVerkauf \
  -destination 'platform=iOS Simulator,name=iPhone 16'
```

## Aufbau

| Ordner | Inhalt |
| --- | --- |
| `KleinVerkauf/Models` | SwiftData-Modelle: Artikel, Mangel, Foto, Anzeigenentwurf |
| `KleinVerkauf/Services` | Service-Protokolle und Wertkopien für testbare Logik |
| `KleinVerkauf/Views` | SwiftUI-Ansichten |
| `KleinVerkaufTests` | Tests mit Swift Testing |

Spezifikation und Regeln stehen in [`CLAUDE.md`](CLAUDE.md).
