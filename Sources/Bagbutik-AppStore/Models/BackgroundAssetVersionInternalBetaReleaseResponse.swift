import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BackgroundAssetVersionInternalBetaReleaseResponse
 A response that contains a single background asset version internal beta release resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/backgroundassetversioninternalbetareleaseresponse>
 */
public struct BackgroundAssetVersionInternalBetaReleaseResponse: Codable, Sendable {
    public let data: BackgroundAssetVersionInternalBetaRelease
    public var included: [BackgroundAssetVersion]?
    public let links: DocumentLinks

    public init(data: BackgroundAssetVersionInternalBetaRelease,
                included: [BackgroundAssetVersion]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BackgroundAssetVersionInternalBetaRelease.self, forKey: "data")
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
