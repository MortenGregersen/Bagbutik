import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # CustomerReviewResponse
 A response that contains a single Customer Review resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/customerreviewresponse>
 */
public struct CustomerReviewResponse: Codable, Sendable {
    /// The data structure that represents a `CustomerReviews` resource.
    public let data: CustomerReview
    /// The requested relationship data.
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: CustomerReview,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(CustomerReview.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getResponse() -> CustomerReviewResponseV1? {
        included?.compactMap { relationship -> CustomerReviewResponseV1? in
            guard case let .customerReviewResponseV1(response) = relationship else { return nil }
            return response
        }.first { $0.id == data.relationships?.response?.data?.id }
    }

    public func getReviewTerritory() -> Territory? {
        included?.compactMap { relationship -> Territory? in
            guard case let .territory(reviewTerritory) = relationship else { return nil }
            return reviewTerritory
        }.first { $0.id == data.relationships?.reviewTerritory?.data?.id }
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
