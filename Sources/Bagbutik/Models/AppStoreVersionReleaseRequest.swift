import Foundation

/**
 The data structure that represents an App Store Version Release Request resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionreleaserequest>
 */
public struct AppStoreVersionReleaseRequest: Codable, RequestBody {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "appStoreVersionReleaseRequests" }

    public init(id: String, links: ResourceLinks) {
        self.id = id
        self.links = links
    }
}
