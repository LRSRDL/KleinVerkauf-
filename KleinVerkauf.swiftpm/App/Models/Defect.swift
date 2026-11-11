import Foundation
import SwiftData

/// Ein bekannter Mangel. Muss im Entwurfstext erscheinen.
@Model
final class Defect {
    var text: String
    var severity: DefectSeverity
    var item: Item?

    init(text: String, severity: DefectSeverity) {
        self.text = text
        self.severity = severity
    }
}
