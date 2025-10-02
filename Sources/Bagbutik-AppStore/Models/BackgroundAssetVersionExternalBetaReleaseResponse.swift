import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BackgroundAssetVersionExternalBetaReleaseResponse
 A response that contains a single background asset version external beta release response resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/backgroundassetversionexternalbetareleaseresponse>
 */
public struct BackgroundAssetVersionExternalBetaReleaseResponse: Codable, Sendable {
    public let data: BackgroundAssetVersionExternalBetaRelease
    public var included: [BackgroundAssetVersion]?
    public let links: DocumentLinks

    public init(data: BackgroundAssetVersionExternalBetaRelease,
                included: [BackgroundAssetVersion]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BackgroundAssetVersionExternalBetaRelease.self, forKey: "data")
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
