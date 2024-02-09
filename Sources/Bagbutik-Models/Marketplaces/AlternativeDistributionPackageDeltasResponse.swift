import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionPackageDeltasResponse
 A response that contains a list of alternative distribution package delta resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionpackagedeltasresponse>
 */
public struct AlternativeDistributionPackageDeltasResponse: Codable, PagedResponse {
    public typealias Data = AlternativeDistributionPackageDelta

    public let data: [AlternativeDistributionPackageDelta]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AlternativeDistributionPackageDelta],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
