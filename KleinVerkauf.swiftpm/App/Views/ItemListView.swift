import SwiftData
import SwiftUI

struct ItemListView: View {
    @Query(sort: \Item.createdAt, order: .reverse) private var items: [Item]

    var body: some View {
        NavigationStack {
            Group {
                if items.isEmpty {
                    ContentUnavailableView(
                        "Noch keine Artikel",
                        systemImage: "shippingbox",
                        description: Text("Lege einen Artikel an, um eine Anzeige vorzubereiten.")
                    )
                } else {
                    List(items) { item in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.title)
                                .font(.headline)
                            Text(item.category)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .accessibilityElement(children: .combine)
                    }
                }
            }
            .navigationTitle("KleinVerkauf")
        }
    }
}

#Preview {
    ItemListView()
        .modelContainer(try! AppSchema.inMemoryContainer())
}
