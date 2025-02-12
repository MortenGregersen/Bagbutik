import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # ScmProviderResponse
 A response that contains a single Providers resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmproviderresponse>
 */
public struct ScmProviderResponse: Codable, Sendable {
    /// The resource data.
    public let data: ScmProvider
    /// The navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: ScmProvider,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(ScmProvider.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
