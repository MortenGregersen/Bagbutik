import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterMatchmakingAppRequestsV1MetricResponse
 The response body for fetching a match request.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingapprequestsv1metricresponse>
 */
public struct GameCenterMatchmakingAppRequestsV1MetricResponse: Codable, Sendable, PagedResponse {
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
                public var averageSecondsInQueue: Double?
                public var count: Int?
                public var p50SecondsInQueue: Double?
                public var p95SecondsInQueue: Double?

                public init(averageSecondsInQueue: Double? = nil,
                            count: Int? = nil,
                            p50SecondsInQueue: Double? = nil,
                            p95SecondsInQueue: Double? = nil)
                {
                    self.averageSecondsInQueue = averageSecondsInQueue
                    self.count = count
                    self.p50SecondsInQueue = p50SecondsInQueue
                    self.p95SecondsInQueue = p95SecondsInQueue
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    averageSecondsInQueue = try container.decodeIfPresent(Double.self, forKey: "averageSecondsInQueue")
                    count = try container.decodeIfPresent(Int.self, forKey: "count")
                    p50SecondsInQueue = try container.decodeIfPresent(Double.self, forKey: "p50SecondsInQueue")
                    p95SecondsInQueue = try container.decodeIfPresent(Double.self, forKey: "p95SecondsInQueue")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(averageSecondsInQueue, forKey: "averageSecondsInQueue")
                    try container.encodeIfPresent(count, forKey: "count")
                    try container.encodeIfPresent(p50SecondsInQueue, forKey: "p50SecondsInQueue")
                    try container.encodeIfPresent(p95SecondsInQueue, forKey: "p95SecondsInQueue")
                }
            }
        }

        public struct Dimensions: Codable, Sendable {
            public var result: Result?

            public init(result: Result? = nil) {
                self.result = result
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                result = try container.decodeIfPresent(Result.self, forKey: "result")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(result, forKey: "result")
            }

            public struct Result: Codable, Sendable {
                @NullCodable public var data: Data?
                public var links: Links?

                public init(data: Data? = nil,
                            links: Links? = nil)
                {
                    self.data = data
                    self.links = links
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decodeIfPresent(Data.self, forKey: "data")
                    links = try container.decodeIfPresent(Links.self, forKey: "links")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                    try container.encodeIfPresent(links, forKey: "links")
                }

                public enum Data: String, Sendable, Codable, CaseIterable {
                    case canceled = "CANCELED"
                    case expired = "EXPIRED"
                    case matched = "MATCHED"

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.singleValueContainer()
                        let string = try container.decode(String.self)
                        if let value = Data(rawValue: string) {
                            self = value
                        } else if let value = Data(rawValue: string.uppercased()) {
                            self = value
                        } else {
                            throw DecodingError.dataCorruptedError(
                                in: container,
                                debugDescription: "Invalid Data value: \(string)"
                            )
                        }
                    }
                }

                public struct Links: Codable, Sendable {
                    public var groupBy: String?

                    public init(groupBy: String? = nil) {
                        self.groupBy = groupBy
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        groupBy = try container.decodeIfPresent(String.self, forKey: "groupBy")
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encodeIfPresent(groupBy, forKey: "groupBy")
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
