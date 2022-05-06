import Foundation

/**
 A response that contains a single Build Actions resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cibuildactionresponse>
 */
public struct CiBuildActionResponse: Codable {
    /// The resource data.
    public let data: CiBuildAction
    /// The included related resources.
    public var included: [CiBuildRun]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: CiBuildAction, included: [CiBuildRun]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
