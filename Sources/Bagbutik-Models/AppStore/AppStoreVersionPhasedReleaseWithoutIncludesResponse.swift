import Bagbutik_Core
import Foundation

public struct AppStoreVersionPhasedReleaseWithoutIncludesResponse: Codable {
    public let data: AppStoreVersion
    public let links: DocumentLinks

    public init(data: AppStoreVersion,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
