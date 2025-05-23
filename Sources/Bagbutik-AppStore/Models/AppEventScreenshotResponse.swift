import Bagbutik_Core
import Bagbutik_Models
import Foundation

public struct AppEventScreenshotResponse: Codable, Sendable {
    public let data: AppEventScreenshot
    public var included: [AppEventLocalization]?
    public let links: DocumentLinks

    public init(data: AppEventScreenshot,
                included: [AppEventLocalization]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppEventScreenshot.self, forKey: "data")
        included = try container.decodeIfPresent([AppEventLocalization].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
