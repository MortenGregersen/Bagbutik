import Bagbutik_Core
import Foundation

/**
 # ImageAsset
 An image asset, including its height, width, and template URL.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/imageasset>
 */
public struct ImageAsset: Codable {
    public var height: Int?
    public var templateUrl: String?
    public var width: Int?

    public init(height: Int? = nil,
                templateUrl: String? = nil,
                width: Int? = nil)
    {
        self.height = height
        self.templateUrl = templateUrl
        self.width = width
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        height = try container.decodeIfPresent(Int.self, forKey: "height")
        templateUrl = try container.decodeIfPresent(String.self, forKey: "templateUrl")
        width = try container.decodeIfPresent(Int.self, forKey: "width")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(height, forKey: "height")
        try container.encodeIfPresent(templateUrl, forKey: "templateUrl")
        try container.encodeIfPresent(width, forKey: "width")
    }
}
