import Bagbutik_Core
import Foundation

public struct BundleIdWithoutIncludesResponse: Codable {
    public let data: Profile
    public let links: DocumentLinks

    public init(data: Profile,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
