import Foundation

public struct ResourceLinks: Codable {
    public let `self`: String

    public init(self aSelf: String) {
        self.`self` = aSelf
    }
}
