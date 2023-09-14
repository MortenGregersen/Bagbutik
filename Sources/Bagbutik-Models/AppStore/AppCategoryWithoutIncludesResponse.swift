import Bagbutik_Core
import Foundation

public struct AppCategoryWithoutIncludesResponse: Codable {
    public let data: AppCategory
    public let links: DocumentLinks

    public init(data: AppCategory,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
