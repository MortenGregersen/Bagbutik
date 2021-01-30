import Foundation

public struct DocumentLinks: Codable {
    public let `self`: String

    public init(self aSelf: String) {
        self.`self` = aSelf
    }
}
