import Foundation

public struct BundleIdCapabilityResponse: Codable {
    public let data: BundleIdCapability
    public let links: DocumentLinks

    public init(data: BundleIdCapability, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
