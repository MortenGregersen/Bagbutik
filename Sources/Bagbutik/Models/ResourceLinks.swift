import Foundation

/**
 Self-links to requested resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/resourcelinks>
 */
public struct ResourceLinks: Codable {
    /// The link to the resource.
    public let `self`: String

    public init(self aSelf: String) {
        self.`self` = aSelf
    }
}
