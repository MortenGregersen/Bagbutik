import Foundation

public struct AppEncryptionDeclarationResponse: Codable {
    public let data: AppEncryptionDeclaration
    public let included: [App]?
    public let links: DocumentLinks

    public init(data: AppEncryptionDeclaration, included: [App]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
