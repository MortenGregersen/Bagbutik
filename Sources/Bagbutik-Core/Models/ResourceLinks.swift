import Foundation

/**
 # ResourceLinks
 Self-links to requested resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/resourcelinks>
 */
public struct ResourceLinks: Codable {
    /// The link to the resource.
    public var itself: String?

    public init(self itself: String? = nil) {
        self.itself = itself
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        itself = try container.decodeIfPresent(String.self, forKey: .itself)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(itself, forKey: .itself)
    }

    private enum CodingKeys: String, CodingKey {
        case itself = "self"
    }
}
