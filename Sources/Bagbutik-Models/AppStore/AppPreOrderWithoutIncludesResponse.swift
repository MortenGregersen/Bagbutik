import Bagbutik_Core
import Foundation

public struct AppPreOrderWithoutIncludesResponse: Codable {
    public let data: AppPreOrder
    public let links: DocumentLinks

    public init(data: AppPreOrder,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
