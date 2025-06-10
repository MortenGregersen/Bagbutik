import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AccessibilityDeclarationResponse
 A response that contains a single accessibility declaration resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/accessibilitydeclarationresponse>
 */
public struct AccessibilityDeclarationResponse: Codable, Sendable {
    public let data: AccessibilityDeclaration
    public let links: DocumentLinks

    public init(data: AccessibilityDeclaration,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AccessibilityDeclaration.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
