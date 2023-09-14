import Bagbutik_Core
import Foundation

public struct BuildWithoutIncludesResponse: Codable {
    public let data: BuildBetaDetail
    public let links: DocumentLinks

    public init(data: BuildBetaDetail,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
