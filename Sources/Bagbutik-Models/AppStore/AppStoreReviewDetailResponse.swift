import Bagbutik_Core
import Foundation

/**
 # AppStoreReviewDetailResponse
 A response that contains a single App Store Review Details resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewdetailresponse>
 */
public struct AppStoreReviewDetailResponse: Codable, Sendable {
    public let data: AppStoreReviewDetail
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: AppStoreReviewDetail,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppStoreReviewDetail.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getAppStoreReviewAttachments() -> [AppStoreReviewAttachment] {
        guard let appStoreReviewAttachmentIds = data.relationships?.appStoreReviewAttachments?.data?.map(\.id),
              let appStoreReviewAttachments = included?.compactMap({ relationship -> AppStoreReviewAttachment? in
                  guard case let .appStoreReviewAttachment(appStoreReviewAttachment) = relationship else { return nil }
                  return appStoreReviewAttachmentIds.contains(appStoreReviewAttachment.id) ? appStoreReviewAttachment : nil
              })
        else {
            return []
        }
        return appStoreReviewAttachments
    }

    public func getAppStoreVersion() -> AppStoreVersion? {
        included?.compactMap { relationship -> AppStoreVersion? in
            guard case let .appStoreVersion(appStoreVersion) = relationship else { return nil }
            return appStoreVersion
        }.first { $0.id == data.relationships?.appStoreVersion?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case appStoreReviewAttachment(AppStoreReviewAttachment)
        case appStoreVersion(AppStoreVersion)

        public init(from decoder: Decoder) throws {
            if let appStoreReviewAttachment = try? AppStoreReviewAttachment(from: decoder) {
                self = .appStoreReviewAttachment(appStoreReviewAttachment)
            } else if let appStoreVersion = try? AppStoreVersion(from: decoder) {
                self = .appStoreVersion(appStoreVersion)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appStoreReviewAttachment(value):
                try value.encode(to: encoder)
            case let .appStoreVersion(value):
                try value.encode(to: encoder)
            }
        }
    }
}
