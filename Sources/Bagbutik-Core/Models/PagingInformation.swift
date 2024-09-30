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

    /**
     # PagingInformation.Paging
     Paging details such as the total number of resources and the per-page limit.

     Adjust the number of resources returned per page by using the `limit` query parameter in your request. For example, the following request  returns the first 10 testers:
     ```
     GET /v1/betaTesters?limit=10
     ```

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/paginginformation/paging>
     */
    public struct Paging: Codable, Sendable {
        /// The maximum number of resources to return per page, from 0 to 200.
        public let limit: Int
        /// The total number of resources matching your request.
        public var total: Int?

        public init(limit: Int,
                    total: Int? = nil)
        {
            self.limit = limit
            self.total = total
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            limit = try container.decode(Int.self, forKey: "limit")
            total = try container.decodeIfPresent(Int.self, forKey: "total")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(limit, forKey: "limit")
            try container.encodeIfPresent(total, forKey: "total")
        }
    }
}
