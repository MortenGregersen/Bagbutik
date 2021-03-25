import Foundation

/**
 A response that contains a single Age Rating Declarations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ageratingdeclarationresponse>
 */
public struct AgeRatingDeclarationResponse: Codable {
    /// The resource data.
    public let data: AgeRatingDeclaration
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AgeRatingDeclaration, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
