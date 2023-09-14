import Bagbutik_Core
import Foundation

public struct AppWithoutIncludesResponse: Codable {
    public let data: PrereleaseVersion
    public let links: DocumentLinks

    public init(data: PrereleaseVersion,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
