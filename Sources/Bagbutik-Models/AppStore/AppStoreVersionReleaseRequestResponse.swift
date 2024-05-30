import Bagbutik_Core
import Foundation

/**
 # AppStoreVersionReleaseRequestResponse
 A response that contains a single App Store Version Release Request resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionreleaserequestresponse>
 */
public struct AppStoreVersionReleaseRequestResponse: Codable {
    /// The resource data.
    public let data: AppStoreVersionReleaseRequest
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppStoreVersionReleaseRequest,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(AppStoreVersionReleaseRequest.self, forKey: .data)
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
