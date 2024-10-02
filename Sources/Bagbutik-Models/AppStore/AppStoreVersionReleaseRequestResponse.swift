import Bagbutik_Core
import Foundation

public struct AppStoreVersionReleaseRequestResponse: Codable, Sendable {
    public let data: AppStoreVersionReleaseRequest
    public let links: DocumentLinks

    public init(data: AppStoreVersionReleaseRequest,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppStoreVersionReleaseRequest.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
