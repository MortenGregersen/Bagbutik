import Bagbutik_Core
import Foundation

/**
 # CiArtifactResponse
 A response that contains a single Artifacts resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciartifactresponse>
 */
public struct CiArtifactResponse: Codable {
    /// The resource data.
    public let data: CiArtifact
    /// The navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: CiArtifact,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(CiArtifact.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
