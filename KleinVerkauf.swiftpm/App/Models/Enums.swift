import Foundation

/// Privat- oder Gewerbeverkauf. Bestimmt, welche Rechtstexte ein Entwurf enthalten darf.
enum SaleType: String, Codable, CaseIterable, Sendable {
    case privateSale
    case commercial
}

/// Zustand eines Artikels, ausschließlich vom Nutzer gesetzt.
enum ItemCondition: String, Codable, CaseIterable, Sendable {
    case new
    case likeNew
    case good
    case acceptable
    case defective
}

enum DefectSeverity: String, Codable, CaseIterable, Sendable {
    case minor
    case moderate
    case major
}

enum ListingStatus: String, Codable, CaseIterable, Sendable {
    case draft
    case active
    case reserved
    case sold
    case archived

    /// Aktive und reservierte Anzeigen zählen für die Dublettenprüfung.
    var countsAsActive: Bool {
        switch self {
        case .active, .reserved: true
        case .draft, .sold, .archived: false
        }
    }
}
