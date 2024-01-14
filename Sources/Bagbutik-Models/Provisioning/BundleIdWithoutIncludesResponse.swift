import Bagbutik_Core
import Foundation

public struct BundleIdWithoutIncludesResponse: Codable {
    public let data: BundleId
    public let links: DocumentLinks

    public init(data: BundleId,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
