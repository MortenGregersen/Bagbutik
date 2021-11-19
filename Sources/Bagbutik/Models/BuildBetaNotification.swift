import Foundation

/**
 The data structure that represents a Build Beta Notifications resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildbetanotification>
 */
public struct BuildBetaNotification: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "buildBetaNotifications" }

    public init(id: String, links: ResourceLinks) {
        self.id = id
        self.links = links
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(links, forKey: .links)
        try container.encode(type, forKey: .type)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case links
        case type
    }
}
