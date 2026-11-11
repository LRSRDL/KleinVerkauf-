import SwiftData
import SwiftUI

@main
struct KleinVerkaufApp: App {
    var body: some Scene {
        WindowGroup {
            ItemListView()
        }
        .modelContainer(for: AppSchema.models)
    }
}
