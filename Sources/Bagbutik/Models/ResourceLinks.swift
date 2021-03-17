import Foundation

/// Self-links to requested resources.
public struct ResourceLinks: Codable {
    /// The link to the resource.
    public let `self`: String

    public init(self aSelf: String) {
        self.`self` = aSelf
    }
}
