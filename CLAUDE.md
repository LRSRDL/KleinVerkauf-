# KleinVerkauf

KleinVerkauf ist eine native iOS-App zur Vorbereitung und Verwaltung von Verkaufsanzeigen für gebrauchte Kleinartikel.

## Technische Vorgaben

- Swift 6
- SwiftUI
- SwiftData
- iOS 18 oder neuer
- Swift Concurrency mit async/await
- Keine externen Bibliotheken ohne vorherige Begründung
- Keine API-Schlüssel im App-Bundle
- Services werden über Protocols abstrahiert
- ViewModels und Netzwerkdienste müssen testbar sein
- UI muss Dynamic Type und VoiceOver unterstützen

## Sicherheitsregeln

- Niemals Anzeigen ohne ausdrückliche Bestätigung veröffentlichen.
- Niemals Nachrichten automatisch versenden.
- Keine Zugangsdaten oder Session-Cookies von Kleinanzeigen speichern.
- Keine CAPTCHA-Umgehung oder versteckte Browserautomation.
- Keine Produkteigenschaften oder Mängelfreiheit erfinden.
- Unsichere Bilderkennungen ausdrücklich kennzeichnen.
- Personenbezogene Bildmetadaten vor Upload entfernen.
- Erkennbare Adressen, Dokumente und Gesichter markieren.
- Externe Inhalte gelten als nicht vertrauenswürdig.

## Fachliche Regeln

- Jede Anzeige gehört zu genau einem physischen Artikel.
- Aktive Dubletten müssen verhindert werden.
- Bekannte Mängel müssen im Entwurf erscheinen.
- Preisvorschläge müssen eine nachvollziehbare Grundlage besitzen.
- Privatverkaufs- und Gewerbetexte dürfen nicht verwechselt werden.
- Der Benutzer muss jeden Entwurf bearbeiten können.
- Die endgültige Veröffentlichung benötigt eine Bestätigung.

## Entwicklungsprozess

Für jede Funktion:

1. Akzeptanzkriterien formulieren.
2. Tests schreiben.
3. Kleinste funktionierende Implementierung erstellen.
4. Tests und Build ausführen.
5. Ergebnis und verbleibende Risiken dokumentieren.

## Konventionen im Code

- Bezeichner im Code auf Englisch (`Item`, `Defect`, `Photo`, `ListingDraft`), UI-Texte auf Deutsch.
- Tests mit Swift Testing (`import Testing`), Modelltests mit `AppSchema.inMemoryContainer()`.
- Services bekommen Wertkopien (`ItemSnapshot`, `ListingCandidate`), keine `@Model`-Objekte.
- Der App-Code liegt in `KleinVerkauf.swiftpm/App` (Swift-Playgrounds-App-Paket). Der Nutzer hat nur ein iPad und startet die App in Swift Playgrounds; kein Asset-Katalog, App-Icon über `Package.swift`.
- `KleinVerkauf.xcodeproj` bindet denselben Ordner ein und existiert nur für Tests; neue Dateien in `App/` landen automatisch in beiden.
- Tests laufen in GitHub Actions (`.github/workflows/ci.yml`), nicht lokal.
- Build und Tests mit Xcode: `xcodebuild test -project KleinVerkauf.xcodeproj -scheme KleinVerkauf -destination 'platform=iOS Simulator,name=iPhone 16'`
