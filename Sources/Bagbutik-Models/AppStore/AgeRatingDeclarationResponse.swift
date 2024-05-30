import Bagbutik_Core
import Foundation

/**
 # AgeRatingDeclarationResponse
 A response that contains a single Age Rating Declarations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ageratingdeclarationresponse>
 */
public struct AgeRatingDeclarationResponse: Codable {
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(AgeRatingDeclaration.self, forKey: .data)
        links = try container.decode(DocumentLinks.self, forKey: .links)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encode(links, forKey: .links)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case links
    }
}
