import Foundation

/**
 A response that contains a single App Pre-Orders resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppreorderresponse>
 */
public struct AppPreOrderResponse: Codable {
    /// The resource data.
    public let data: AppPreOrder
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppPreOrder, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
