import Foundation

/// Erzeugt den Beschreibungstext aus den Artikeldaten. Erfindet keine Eigenschaften.
protocol ListingTextBuilding: Sendable {
    func makeBody(for item: ItemSnapshot) -> String
}

/// Findet aktive Anzeigen, die denselben Artikel beschreiben.
protocol DuplicateChecking: Sendable {
    func activeDuplicates(of candidate: ListingCandidate, among existing: [ListingCandidate]) -> [ListingCandidate]
}

/// Entfernt GPS-, Kamera- und Gerätedaten aus einem Bild.
protocol PhotoExporting: Sendable {
    func dataWithoutMetadata(from imageData: Data) async throws -> Data
}

/// Übergibt den bestätigten Text an die Zwischenablage. Versendet nie selbst etwas.
@MainActor
protocol ClipboardSharing {
    func copy(_ text: String)
}
