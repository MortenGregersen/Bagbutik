import Foundation

public struct EndUserLicenseAgreementResponse: Codable {
    public let data: EndUserLicenseAgreement
    public let included: [Territory]?
    public let links: DocumentLinks

    public init(data: EndUserLicenseAgreement, included: [Territory]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
