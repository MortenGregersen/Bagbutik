import Bagbutik_Core
import Foundation

/**
 # CiMacOsVersionResponse
 A response that contains a single macOS Versions resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cimacosversionresponse>
 */
public struct CiMacOsVersionResponse: Codable {
    /// The resource data.
    public let data: CiMacOsVersion
    /// The requested relationship data.
    public var included: [CiXcodeVersion]?
    /// The navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: CiMacOsVersion,
                included: [CiXcodeVersion]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(CiMacOsVersion.self, forKey: "data")
        included = try container.decodeIfPresent([CiXcodeVersion].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
