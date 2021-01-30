import Foundation

public struct BetaLicenseAgreementResponse: Codable {
    public let data: BetaLicenseAgreement
    public let included: [App]?
    public let links: DocumentLinks

    public init(data: BetaLicenseAgreement, included: [App]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
