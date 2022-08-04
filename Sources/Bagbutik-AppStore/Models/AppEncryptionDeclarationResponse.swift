import Foundation
import Bagbutik_Core

/**
 # AppEncryptionDeclarationResponse
 A response that contains a single App Encryption Declarations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appencryptiondeclarationresponse>
 */
public struct AppEncryptionDeclarationResponse: Codable {
    /// The resource data.
    public let data: AppEncryptionDeclaration
    public var included: [App]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppEncryptionDeclaration,
                included: [App]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
