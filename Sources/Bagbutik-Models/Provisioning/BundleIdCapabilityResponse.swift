import Bagbutik_Core
import Foundation

/**
 # BundleIdCapabilityResponse
 A response that contains a single Bundle ID Capabilities resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcapabilityresponse>
 */
public struct BundleIdCapabilityResponse: Codable, Sendable {
    /// The resource data.
    public let data: BundleIdCapability
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: BundleIdCapability,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BundleIdCapability.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
