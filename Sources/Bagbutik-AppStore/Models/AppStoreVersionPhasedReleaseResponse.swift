import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppStoreVersionPhasedReleaseResponse
 The response body for endpoints that create, read, or modify the phased release schedule for an App Store version.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionphasedreleaseresponse>
 */
public struct AppStoreVersionPhasedReleaseResponse: Codable, Sendable {
    public let data: AppStoreVersionPhasedRelease
    public let links: DocumentLinks

    public init(data: AppStoreVersionPhasedRelease,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppStoreVersionPhasedRelease.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
