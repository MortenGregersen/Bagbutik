import Bagbutik_Core
import Foundation

public struct BetaAppReviewDetailWithoutIncludesResponse: Codable {
    public let data: BetaAppReviewDetail
    public let links: DocumentLinks

    public init(data: BetaAppReviewDetail,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
