import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppStoreVersionReleaseRequest
 The data structure that represents an App Store Version Release Request resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionreleaserequest>
 */
public struct AppStoreVersionReleaseRequest: Codable, Sendable, Identifiable, RequestBody {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "appStoreVersionReleaseRequests" }

    public init(id: String,
                links: ResourceLinks? = nil)
    {
        self.id = id
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
    }
}
