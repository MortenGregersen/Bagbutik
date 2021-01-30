import Foundation

public struct BetaLicenseAgreementsResponse: Codable {
    public let data: [BetaLicenseAgreement]
    public let included: [App]?
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [BetaLicenseAgreement], included: [App]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
