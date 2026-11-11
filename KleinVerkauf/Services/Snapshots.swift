import Foundation

/// Wertkopien der Modelle, damit Services `Sendable` bleiben und ohne SwiftData testbar sind.
struct DefectSnapshot: Equatable, Sendable {
    var text: String
    var severity: DefectSeverity
}

struct ItemSnapshot: Equatable, Sendable {
    var id: UUID
    var title: String
    var category: String
    var condition: ItemCondition
    var saleType: SaleType
    var defects: [DefectSnapshot]
}

struct ListingCandidate: Equatable, Sendable {
    var itemID: UUID
    var title: String
    var category: String
    var status: ListingStatus
}

extension ItemSnapshot {
    init(_ item: Item) {
        self.init(
            id: item.id,
            title: item.title,
            category: item.category,
            condition: item.condition,
            saleType: item.saleType,
            defects: item.defects.map { DefectSnapshot(text: $0.text, severity: $0.severity) }
        )
    }
}
