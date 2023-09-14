import Bagbutik_Core
import Foundation

/**
 # EndAppAvailabilityPreOrderResponse
 A response that contains a single end app availability resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/endappavailabilitypreorderresponse>
 */
public struct EndAppAvailabilityPreOrderResponse: Codable {
    public let data: EndAppAvailabilityPreOrder
    public let links: DocumentLinks

    public init(data: EndAppAvailabilityPreOrder,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
