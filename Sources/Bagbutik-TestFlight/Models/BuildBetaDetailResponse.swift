import Foundation
import Bagbutik_Core

/**
 # BuildBetaDetailResponse
 A response that contains a single Build Beta Details resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildbetadetailresponse>
 */
public struct BuildBetaDetailResponse: Codable {
    /// The resource data.
    public let data: BuildBetaDetail
    public var included: [Build]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: BuildBetaDetail,
                included: [Build]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
