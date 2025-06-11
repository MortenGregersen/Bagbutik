import Bagbutik_Core
import Foundation

public struct BetaFeedbackScreenshotImage: Codable, Sendable {
    public var expirationDate: Date?
    public var height: Int?
    public var url: String?
    public var width: Int?

    public init(expirationDate: Date? = nil,
                height: Int? = nil,
                url: String? = nil,
                width: Int? = nil)
    {
        self.expirationDate = expirationDate
        self.height = height
        self.url = url
        self.width = width
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        expirationDate = try container.decodeIfPresent(Date.self, forKey: "expirationDate")
        height = try container.decodeIfPresent(Int.self, forKey: "height")
        url = try container.decodeIfPresent(String.self, forKey: "url")
        width = try container.decodeIfPresent(Int.self, forKey: "width")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(expirationDate, forKey: "expirationDate")
        try container.encodeIfPresent(height, forKey: "height")
        try container.encodeIfPresent(url, forKey: "url")
        try container.encodeIfPresent(width, forKey: "width")
    }
}
