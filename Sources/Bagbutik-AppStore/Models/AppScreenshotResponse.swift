import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppScreenshotResponse
 A response that contains a single App Screenshots resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshotresponse>
 */
public struct AppScreenshotResponse: Codable, Sendable {
    public let data: AppScreenshot
    public var included: [AppScreenshotSet]?
    public let links: DocumentLinks

    public init(data: AppScreenshot,
                included: [AppScreenshotSet]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppScreenshot.self, forKey: "data")
        included = try container.decodeIfPresent([AppScreenshotSet].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
