import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterMatchmakingRuleErrorsV1MetricResponse
 The response body for fetching the rule errors.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleerrorsv1metricresponse>
 */
public struct GameCenterMatchmakingRuleErrorsV1MetricResponse: Codable, Sendable, PagedResponse {
    public let data: [Data]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [Data],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([Data].self, forKey: "data")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }

    public struct Data: Codable, Sendable {
        public var dataPoints: DataPoints?
        public var dimensions: Dimensions?
        public var granularity: Granularity?

        public init(dataPoints: DataPoints? = nil,
                    dimensions: Dimensions? = nil,
                    granularity: Granularity? = nil)
        {
            self.dataPoints = dataPoints
            self.dimensions = dimensions
            self.granularity = granularity
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            dataPoints = try container.decodeIfPresent(DataPoints.self, forKey: "dataPoints")
            dimensions = try container.decodeIfPresent(Dimensions.self, forKey: "dimensions")
            granularity = try container.decodeIfPresent(Granularity.self, forKey: "granularity")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(dataPoints, forKey: "dataPoints")
            try container.encodeIfPresent(dimensions, forKey: "dimensions")
            try container.encodeIfPresent(granularity, forKey: "granularity")
        }

        public struct DataPoints: Codable, Sendable {
            public var end: Date?
            public var start: Date?
            public var values: Values?

            public init(end: Date? = nil,
                        start: Date? = nil,
                        values: Values? = nil)
            {
                self.end = end
                self.start = start
                self.values = values
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                end = try container.decodeIfPresent(Date.self, forKey: "end")
                start = try container.decodeIfPresent(Date.self, forKey: "start")
                values = try container.decodeIfPresent(Values.self, forKey: "values")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(end, forKey: "end")
                try container.encodeIfPresent(start, forKey: "start")
                try container.encodeIfPresent(values, forKey: "values")
            }

            public struct Values: Codable, Sendable {
                public var count: Int?

                public init(count: Int? = nil) {
                    self.count = count
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    count = try container.decodeIfPresent(Int.self, forKey: "count")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(count, forKey: "count")
                }
            }
        }

        public struct Dimensions: Codable, Sendable {
            public var gameCenterMatchmakingQueue: GameCenterMatchmakingQueue?

            public init(gameCenterMatchmakingQueue: GameCenterMatchmakingQueue? = nil) {
                self.gameCenterMatchmakingQueue = gameCenterMatchmakingQueue
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                gameCenterMatchmakingQueue = try container.decodeIfPresent(GameCenterMatchmakingQueue.self, forKey: "gameCenterMatchmakingQueue")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(gameCenterMatchmakingQueue, forKey: "gameCenterMatchmakingQueue")
            }

            public struct GameCenterMatchmakingQueue: Codable, Sendable {
                public var data: String?
                public var links: Links?

                public init(data: String? = nil,
                            links: Links? = nil)
                {
                    self.data = data
                    self.links = links
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decodeIfPresent(String.self, forKey: "data")
                    links = try container.decodeIfPresent(Links.self, forKey: "links")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(data, forKey: "data")
                    try container.encodeIfPresent(links, forKey: "links")
                }

                public struct Links: Codable, Sendable {
                    public var groupBy: String?
                    public var related: String?

                    public init(groupBy: String? = nil,
                                related: String? = nil)
                    {
                        self.groupBy = groupBy
                        self.related = related
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        groupBy = try container.decodeIfPresent(String.self, forKey: "groupBy")
                        related = try container.decodeIfPresent(String.self, forKey: "related")
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encodeIfPresent(groupBy, forKey: "groupBy")
                        try container.encodeIfPresent(related, forKey: "related")
                    }
                }
            }
        }

        public enum Granularity: String, Sendable, Codable, CaseIterable {
            case P1D
            case PT15M
            case PT1H

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Granularity(rawValue: string) {
                    self = value
                } else if let value = Granularity(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Granularity value: \(string)"
                    )
                }
            }
        }
    }
}
