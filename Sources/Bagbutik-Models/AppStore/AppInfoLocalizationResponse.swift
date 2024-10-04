import Bagbutik_Core
import Foundation

/**
 # AppInfoLocalizationResponse
 A response that contains a single App Info Localizations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalizationresponse>
 */
public struct AppInfoLocalizationResponse: Codable, Sendable {
    public let data: AppInfoLocalization
    public var included: [AppInfo]?
    public let links: DocumentLinks

    public init(data: AppInfoLocalization,
                included: [AppInfo]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppInfoLocalization.self, forKey: "data")
        included = try container.decodeIfPresent([AppInfo].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
