import Foundation

/**
 A response that contains a single App Pre-Orders resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppreorderresponse>
 */
public struct AppPreOrderResponse: Codable {
    /// The resource data.
    public let data: AppPreOrder
    /// The included related resources.
    public var included: [App]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppPreOrder, included: [App]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
