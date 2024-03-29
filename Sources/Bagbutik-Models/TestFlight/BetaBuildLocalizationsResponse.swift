import Bagbutik_Core
import Foundation

/**
 # BetaBuildLocalizationsResponse
 A response that contains a list of Beta Build Localization resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalizationsresponse>
 */
public struct BetaBuildLocalizationsResponse: Codable, PagedResponse {
    public typealias Data = BetaBuildLocalization

    /// The resource data.
    public let data: [BetaBuildLocalization]
    public var included: [Build]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public var meta: PagingInformation?

    public init(data: [BetaBuildLocalization],
                included: [Build]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
