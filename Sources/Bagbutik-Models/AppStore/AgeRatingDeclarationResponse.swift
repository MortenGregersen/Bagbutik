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
}
