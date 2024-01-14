import Bagbutik_Core
import Foundation

public struct EndUserLicenseAgreementWithoutIncludesResponse: Codable {
    public let data: EndUserLicenseAgreement
    public let links: DocumentLinks

    public init(data: EndUserLicenseAgreement,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
