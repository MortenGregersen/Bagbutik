import Bagbutik_Core
import Foundation

public struct AgeRatingDeclarationWithoutIncludesResponse: Codable {
    public let data: AgeRatingDeclaration
    public let links: DocumentLinks

    public init(data: AgeRatingDeclaration,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
