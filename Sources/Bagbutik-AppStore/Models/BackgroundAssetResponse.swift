import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BackgroundAssetResponse
 A response that contains a single background asset version resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/backgroundassetresponse>
 */
public struct BackgroundAssetResponse: Codable, Sendable {
    public let data: BackgroundAsset
    public var included: [BackgroundAssetVersion]?
    public let links: DocumentLinks

    public init(data: BackgroundAsset,
                included: [BackgroundAssetVersion]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BackgroundAsset.self, forKey: "data")
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
