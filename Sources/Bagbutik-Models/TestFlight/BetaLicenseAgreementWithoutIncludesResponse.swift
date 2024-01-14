import Bagbutik_Core
import Foundation

public struct BetaLicenseAgreementWithoutIncludesResponse: Codable {
    public let data: BetaLicenseAgreement
    public let links: DocumentLinks

    public init(data: BetaLicenseAgreement,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
