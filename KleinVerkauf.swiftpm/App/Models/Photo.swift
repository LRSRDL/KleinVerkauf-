import Foundation
import SwiftData

/// Ein Foto im App-Container. Exportiert wird nur eine Kopie ohne Metadaten.
@Model
final class Photo {
    var fileName: String
    var sortIndex: Int
    var metadataStripped: Bool
    var item: Item?

    init(fileName: String, sortIndex: Int, metadataStripped: Bool = false) {
        self.fileName = fileName
        self.sortIndex = sortIndex
        self.metadataStripped = metadataStripped
    }
}
