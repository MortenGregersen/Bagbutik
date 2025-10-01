import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BackgroundAssetVersionAppStoreReleaseResponse
 A response that contains a single background asset version App Store release response resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/backgroundassetversionappstorereleaseresponse>
 */
public struct BackgroundAssetVersionAppStoreReleaseResponse: Codable, Sendable {
    public let data: BackgroundAssetVersionAppStoreRelease
    public var included: [BackgroundAssetVersion]?
    public let links: DocumentLinks

    public init(data: BackgroundAssetVersionAppStoreRelease,
                included: [BackgroundAssetVersion]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BackgroundAssetVersionAppStoreRelease.self, forKey: "data")
        included = try container.decodeIfPresent([BackgroundAssetVersion].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
