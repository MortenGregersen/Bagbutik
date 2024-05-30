import Bagbutik_Core
import Foundation

/**
 # CiIssueResponse
 A response that contains a single Issues resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciissueresponse>
 */
public struct CiIssueResponse: Codable {
    /// The resource data.
    public let data: CiIssue
    /// The navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: CiIssue,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(CiIssue.self, forKey: .data)
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
