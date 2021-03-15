import Foundation

/// A response that contains a single End User License Agreements resource.
public struct EndUserLicenseAgreementResponse: Codable {
    /// The resource data.
    public let data: EndUserLicenseAgreement
    public let included: [Territory]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: EndUserLicenseAgreement, included: [Territory]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
