import Foundation

public struct CertificateResponse: Codable {
    public let data: Certificate
    public let links: DocumentLinks

    public init(data: Certificate, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
