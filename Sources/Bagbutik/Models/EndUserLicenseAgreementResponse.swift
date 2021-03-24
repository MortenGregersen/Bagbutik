import Foundation

/**
 A response that contains a single End User License Agreements resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/enduserlicenseagreementresponse>
 */
public struct EndUserLicenseAgreementResponse: Codable {
    /// The resource data.
    public let data: EndUserLicenseAgreement
    /// The included related resources.
    public let included: [Territory]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: EndUserLicenseAgreement, included: [Territory]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
