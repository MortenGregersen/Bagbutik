import Foundation

public struct AgeRatingDeclarationResponse: Codable {
    public let data: AgeRatingDeclaration
    public let links: DocumentLinks

    public init(data: AgeRatingDeclaration, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
