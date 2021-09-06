import Foundation

/**
 A response that contains a single Git References resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmgitreferenceresponse>
 */
public struct ScmGitReferenceResponse: Codable {
    /// The resource data.
    public let data: ScmGitReference
    /// The included related resources.
    public let included: [ScmRepository]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: ScmGitReference, included: [ScmRepository]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
