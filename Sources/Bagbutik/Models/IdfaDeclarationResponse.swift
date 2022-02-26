import Foundation

/**
 A response that contains a single IDFA Declarations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/idfadeclarationresponse>
 */
public struct IdfaDeclarationResponse: Codable {
    /// The resource data.
    public let data: IdfaDeclaration
    /// The included related resources.
    @NullCodable public var included: [AppStoreVersion]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: IdfaDeclaration, included: [AppStoreVersion]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
