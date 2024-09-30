import Bagbutik_Core
import Foundation

/**
 # AgeRatingDeclarationResponse
 A response that contains a single Age Rating Declarations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ageratingdeclarationresponse>
 */
public struct AgeRatingDeclarationResponse: Codable, Sendable {
    /// The data structure that represents the Age Rating Declarations resource.
    public let data: AgeRatingDeclaration
    /// Navigational links including the self-link and links to the related data.
    public let links: DocumentLinks

    public init(data: AgeRatingDeclaration,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AgeRatingDeclaration.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
