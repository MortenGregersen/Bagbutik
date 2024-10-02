import Foundation

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
