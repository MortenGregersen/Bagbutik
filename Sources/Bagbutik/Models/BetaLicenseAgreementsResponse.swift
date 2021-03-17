import Foundation

/**
 A response that contains a list of Beta License Agreement resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betalicenseagreementsresponse>
 */
public struct BetaLicenseAgreementsResponse: Codable {
    /// The resource data.
    public let data: [BetaLicenseAgreement]
    public let included: [App]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [BetaLicenseAgreement], included: [App]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
