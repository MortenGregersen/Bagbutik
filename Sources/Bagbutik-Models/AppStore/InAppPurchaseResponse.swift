import Bagbutik_Core
import Foundation

/**
 # InAppPurchaseResponse
 A response that contains a single In-App Purchases resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchaseresponse>
 */
public struct InAppPurchaseResponse: Codable {
    public let data: InAppPurchase
    public var included: [App]?
    public let links: DocumentLinks

    public init(data: InAppPurchase,
                included: [App]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
