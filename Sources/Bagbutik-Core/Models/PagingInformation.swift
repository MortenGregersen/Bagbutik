import Foundation

/**
 # PagingInformation
 Paging information for data responses.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/paginginformation>
 */
public struct PagingInformation: Codable, Sendable {
    /// The paging information details.
    public let paging: Paging

    public init(paging: Paging) {
        self.paging = paging
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        paging = try container.decode(Paging.self, forKey: "paging")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(paging, forKey: "paging")
    }

    public struct Paging: Codable, Sendable {
        public let limit: Int
        public var nextCursor: String?
        public var total: Int?

        public init(limit: Int,
                    nextCursor: String? = nil,
                    total: Int? = nil)
        {
            self.limit = limit
            self.nextCursor = nextCursor
            self.total = total
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            limit = try container.decode(Int.self, forKey: "limit")
            nextCursor = try container.decodeIfPresent(String.self, forKey: "nextCursor")
            total = try container.decodeIfPresent(Int.self, forKey: "total")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(limit, forKey: "limit")
            try container.encodeIfPresent(nextCursor, forKey: "nextCursor")
            try container.encodeIfPresent(total, forKey: "total")
        }
    }
}
