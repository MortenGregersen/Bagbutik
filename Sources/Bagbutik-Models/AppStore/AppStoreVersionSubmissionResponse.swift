import Bagbutik_Core
import Foundation

/**
 # AppStoreVersionSubmissionResponse
 A response that contains a single App Store Version Submissions resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionsubmissionresponse>
 */
public struct AppStoreVersionSubmissionResponse: Codable, Sendable {
    public let data: AppStoreVersionSubmission
    public var included: [AppStoreVersion]?
    public let links: DocumentLinks

    public init(data: AppStoreVersionSubmission,
                included: [AppStoreVersion]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppStoreVersionSubmission.self, forKey: "data")
        included = try container.decodeIfPresent([AppStoreVersion].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
