import Foundation

/**
 A response that contains a single App Pre-Orders resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppreorderresponse>
 */
public struct AppPreOrderResponse: Codable {
    public let data: AppPreOrder
    public var included: [App]?
    public let links: DocumentLinks

    public init(data: AppPreOrder, included: [App]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
