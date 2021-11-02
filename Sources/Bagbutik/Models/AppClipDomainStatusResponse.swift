import Foundation

public struct AppClipDomainStatusResponse: Codable {
    public let data: AppClipDomainStatus
    public let links: DocumentLinks

    public init(data: AppClipDomainStatus, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
