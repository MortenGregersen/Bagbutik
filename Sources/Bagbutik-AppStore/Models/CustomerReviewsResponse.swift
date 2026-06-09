import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # CustomerReviewsResponse
 A response that contains a list of Customer Reviews resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/customerreviewsresponse>
 */
public struct CustomerReviewsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = CustomerReview

    /// A list of customer review resource data.
    public let data: [CustomerReview]
    /// The requested relationship data.
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public var meta: PagingInformation?

    public init(data: [CustomerReview],
                included: [Included]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([CustomerReview].self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }

    public func getResponse(for customerReview: CustomerReview) -> CustomerReviewResponseV1? {
        included?.compactMap { relationship -> CustomerReviewResponseV1? in
            guard case let .customerReviewResponseV1(response) = relationship else { return nil }
            return response
        }.first { $0.id == customerReview.relationships?.response?.data?.id }
    }

    public func getReviewTerritory(for customerReview: CustomerReview) -> Territory? {
        included?.compactMap { relationship -> Territory? in
            guard case let .territory(reviewTerritory) = relationship else { return nil }
            return reviewTerritory
        }.first { $0.id == customerReview.relationships?.reviewTerritory?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case customerReviewResponseV1(CustomerReviewResponseV1)
        case territory(Territory)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "customerReviewResponses":
                self = .customerReviewResponseV1(try CustomerReviewResponseV1(from: decoder))
            case "territories":
                self = .territory(try Territory(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .customerReviewResponseV1(value):
                try value.encode(to: encoder)
            case let .territory(value):
                try value.encode(to: encoder)
            }
        }
    }
}
