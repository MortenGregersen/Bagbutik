import Bagbutik_Core
import Foundation

public struct AppStoreVersionPhasedReleaseWithoutIncludesResponse: Codable {
    public let data: AppStoreVersionPhasedRelease
    public let links: DocumentLinks

    public init(data: AppStoreVersionPhasedRelease,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
