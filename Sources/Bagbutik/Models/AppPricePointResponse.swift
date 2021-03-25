import Foundation

/**
 A response that contains a single App Price Points resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppricepointresponse>
 */
public struct AppPricePointResponse: Codable {
    /// The resource data.
    public let data: AppPricePoint
    /// The included related resources.
    public let included: [Territory]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppPricePoint, included: [Territory]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
