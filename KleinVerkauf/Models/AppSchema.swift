import SwiftData

/// Alle persistierten Modelle an einer Stelle, damit App und Tests denselben Container bauen.
enum AppSchema {
    static var models: [any PersistentModel.Type] {
        [Item.self, Defect.self, Photo.self, ListingDraft.self]
    }

    /// Container nur im Speicher, für Tests und SwiftUI-Previews.
    static func inMemoryContainer() throws -> ModelContainer {
        try ModelContainer(
            for: Schema(models),
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
    }
}
