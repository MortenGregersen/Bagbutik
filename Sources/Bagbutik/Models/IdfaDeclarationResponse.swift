import Foundation

/**
 A response that contains a single IDFA Declarations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/idfadeclarationresponse>
 */
public struct IdfaDeclarationResponse: Codable {
    /// The resource data.
    public let data: IdfaDeclaration
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: IdfaDeclaration, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
