import Bagbutik_Core
import Foundation

/**
 # AppClipDomainStatusResponse
 A response that contains a single App Clip Domain Statuses resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdomainstatusresponse>
 */
public struct AppClipDomainStatusResponse: Codable {
    /// The resource data.
    public let data: AppClipDomainStatus
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppClipDomainStatus,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(AppClipDomainStatus.self, forKey: .data)
        links = try container.decode(DocumentLinks.self, forKey: .links)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encode(links, forKey: .links)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case links
    }
}
