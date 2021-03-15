import Foundation

/// A response that contains a single Beta License Agreements resource.
public struct BetaLicenseAgreementResponse: Codable {
    /// The resource data.
    public let data: BetaLicenseAgreement
    public let included: [App]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: BetaLicenseAgreement, included: [App]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
