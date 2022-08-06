import Bagbutik_Core
import Foundation

/**
 # DevicesResponse
 A response that contains a list of Devices resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/devicesresponse>
 */
public struct DevicesResponse: Codable, PagedResponse {
    public typealias Data = Device

    /// The resource data.
    public let data: [Device]
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public var meta: PagingInformation?

    public init(data: [Device],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
