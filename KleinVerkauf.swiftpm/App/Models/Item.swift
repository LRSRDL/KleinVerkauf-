import Foundation
import SwiftData

/// Ein physischer Gegenstand. Zu jedem Artikel gehört höchstens ein Entwurf (eine Anzeige).
@Model
final class Item {
    var id: UUID
    var title: String
    var category: String
    var condition: ItemCondition
    var saleType: SaleType
    var createdAt: Date

    @Relationship(deleteRule: .cascade, inverse: \Defect.item)
    var defects: [Defect] = []

    @Relationship(deleteRule: .cascade, inverse: \Photo.item)
    var photos: [Photo] = []

    @Relationship(deleteRule: .cascade, inverse: \ListingDraft.item)
    var draft: ListingDraft?

    init(
        title: String,
        category: String,
        condition: ItemCondition,
        saleType: SaleType,
        createdAt: Date = .now
    ) {
        self.id = UUID()
        self.title = title
        self.category = category
        self.condition = condition
        self.saleType = saleType
        self.createdAt = createdAt
    }
}
