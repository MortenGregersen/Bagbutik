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
}
