import Foundation
import SwiftData
import Testing
@testable import KleinVerkauf

@MainActor
struct ModelTests {
    @Test func itemKeepsDefectsAndDraftAfterSave() throws {
        let container = try AppSchema.inMemoryContainer()
        let context = container.mainContext

        let item = Item(title: "Kaffeemühle", category: "Küche", condition: .good, saleType: .privateSale)
        context.insert(item)
        item.defects.append(Defect(text: "Kratzer am Deckel", severity: .minor))
        item.draft = ListingDraft(title: "Kaffeemühle, funktioniert", body: "")
        try context.save()

        let fetched = try context.fetch(FetchDescriptor<Item>())
        #expect(fetched.count == 1)
        #expect(fetched.first?.defects.map(\.text) == ["Kratzer am Deckel"])
        #expect(fetched.first?.draft?.status == .draft)
    }

    @Test func deletingItemDeletesItsDefectsAndDraft() throws {
        let container = try AppSchema.inMemoryContainer()
        let context = container.mainContext

        let item = Item(title: "Lampe", category: "Wohnen", condition: .acceptable, saleType: .privateSale)
        context.insert(item)
        item.defects.append(Defect(text: "Schalter klemmt", severity: .moderate))
        item.draft = ListingDraft(title: "Lampe", body: "")
        try context.save()

        context.delete(item)
        try context.save()

        #expect(try context.fetch(FetchDescriptor<Defect>()).isEmpty)
        #expect(try context.fetch(FetchDescriptor<ListingDraft>()).isEmpty)
    }

    @Test(arguments: ListingStatus.allCases)
    func onlyActiveAndReservedCountAsActive(status: ListingStatus) {
        #expect(status.countsAsActive == (status == .active || status == .reserved))
    }

    @Test func snapshotCopiesDefects() throws {
        let container = try AppSchema.inMemoryContainer()
        let item = Item(title: "Rucksack", category: "Taschen", condition: .good, saleType: .commercial)
        container.mainContext.insert(item)
        item.defects.append(Defect(text: "Reißverschluss hakt", severity: .minor))

        let snapshot = ItemSnapshot(item)

        #expect(snapshot.saleType == .commercial)
        #expect(snapshot.defects == [DefectSnapshot(text: "Reißverschluss hakt", severity: .minor)])
    }
}
