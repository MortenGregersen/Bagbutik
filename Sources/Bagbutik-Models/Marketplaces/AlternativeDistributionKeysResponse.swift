import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionKeysResponse
 A response that contains a list of alternative distribution keys.

 For more information about the response that includes this alternative distribution key object, see ``AlternativeDistributionKeyResponse``.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionkeysresponse>
 */
public struct AlternativeDistributionKeysResponse: Codable, PagedResponse {
    public typealias Data = AlternativeDistributionKey

    public let data: [AlternativeDistributionKey]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AlternativeDistributionKey],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
