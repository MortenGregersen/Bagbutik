import Bagbutik_Core
import Foundation

public struct AppEncryptionDeclarationWithoutIncludesResponse: Codable {
    public let data: AppEncryptionDeclaration
    public let links: DocumentLinks

    public init(data: AppEncryptionDeclaration,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
