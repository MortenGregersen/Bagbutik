import Foundation

/**
 A response that contains a single Providers resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmproviderresponse>
 */
public struct ScmProviderResponse: Codable {
    /// The resource data.
    public let data: ScmProvider
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: ScmProvider, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
