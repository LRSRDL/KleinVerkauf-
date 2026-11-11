import Foundation
import SwiftData

/// Der Anzeigenentwurf für genau einen Artikel.
@Model
final class ListingDraft {
    var title: String
    var body: String
    /// Preis in Cent, `nil` solange keiner gesetzt ist.
    var priceCents: Int?
    /// Nachvollziehbare Grundlage für den Preis. Pflicht vor der Bestätigung.
    var priceRationale: String
    var isNegotiable: Bool
    var status: ListingStatus
    var confirmedAt: Date?
    var item: Item?

    init(
        title: String,
        body: String,
        priceCents: Int? = nil,
        priceRationale: String = "",
        isNegotiable: Bool = false,
        status: ListingStatus = .draft
    ) {
        self.title = title
        self.body = body
        self.priceCents = priceCents
        self.priceRationale = priceRationale
        self.isNegotiable = isNegotiable
        self.status = status
    }
}
