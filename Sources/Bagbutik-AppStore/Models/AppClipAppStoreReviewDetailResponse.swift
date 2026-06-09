import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppClipAppStoreReviewDetailResponse
 A response containing the App Store review details for a single App Clip.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetailresponse>
 */
public struct AppClipAppStoreReviewDetailResponse: Codable, Sendable {
    /// The resource data.
    public let data: AppClipAppStoreReviewDetail
    /// The requested relationship data.
    public var included: [AppClipDefaultExperience]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppClipAppStoreReviewDetail,
                included: [AppClipDefaultExperience]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppClipAppStoreReviewDetail.self, forKey: "data")
        included = try container.decodeIfPresent([AppClipDefaultExperience].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
