import Bagbutik_Core
import Foundation

/**
 # BetaLicenseAgreementResponse
 A response that contains a single Beta License Agreements resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betalicenseagreementresponse>
 */
public struct BetaLicenseAgreementResponse: Codable {
    /// The resource data.
    public let data: BetaLicenseAgreement
    public var included: [App]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: BetaLicenseAgreement,
                included: [App]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
