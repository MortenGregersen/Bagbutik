import Foundation

/**
 # PagingInformation

 Paging information for data responses.

 ```
 object PagingInformation
 ```

 ## Topics

 ### Objects

 [`object PagingInformation.Paging`](https://developer.apple.com/documentation/AppStoreConnectAPI/PagingInformation/Paging-data.dictionary)

 Paging details such as the total number of resources and the per-page limit.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/paginginformation>
 */
public struct PagingInformation: Codable, Sendable {
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
