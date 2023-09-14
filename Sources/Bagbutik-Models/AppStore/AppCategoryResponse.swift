import Bagbutik_Core
import Foundation

/**
 # AppCategoryResponse
 A response that contains a single App Categories resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appcategoryresponse>
 */
public struct AppCategoryResponse: Codable {
    public let data: AppCategory
    public var included: [AppCategory]?
    public let links: DocumentLinks

    public init(data: AppCategory,
                included: [AppCategory]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
