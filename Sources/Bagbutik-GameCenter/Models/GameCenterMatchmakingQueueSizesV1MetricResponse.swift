import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterMatchmakingQueueSizesV1MetricResponse
 The response body for fetching the queue sizes.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueuesizesv1metricresponse>
 */
public struct GameCenterMatchmakingQueueSizesV1MetricResponse: Codable, Sendable, PagedResponse {
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
        public var granularity: Granularity?

        public init(dataPoints: DataPoints? = nil,
                    granularity: Granularity? = nil)
        {
            self.dataPoints = dataPoints
            self.granularity = granularity
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            dataPoints = try container.decodeIfPresent(DataPoints.self, forKey: "dataPoints")
            granularity = try container.decodeIfPresent(Granularity.self, forKey: "granularity")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(dataPoints, forKey: "dataPoints")
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
                public var averageNumberOfRequests: Double?
                public var count: Int?
                public var p50NumberOfRequests: Double?
                public var p95NumberOfRequests: Double?

                public init(averageNumberOfRequests: Double? = nil,
                            count: Int? = nil,
                            p50NumberOfRequests: Double? = nil,
                            p95NumberOfRequests: Double? = nil)
                {
                    self.averageNumberOfRequests = averageNumberOfRequests
                    self.count = count
                    self.p50NumberOfRequests = p50NumberOfRequests
                    self.p95NumberOfRequests = p95NumberOfRequests
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    averageNumberOfRequests = try container.decodeIfPresent(Double.self, forKey: "averageNumberOfRequests")
                    count = try container.decodeIfPresent(Int.self, forKey: "count")
                    p50NumberOfRequests = try container.decodeIfPresent(Double.self, forKey: "p50NumberOfRequests")
                    p95NumberOfRequests = try container.decodeIfPresent(Double.self, forKey: "p95NumberOfRequests")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(averageNumberOfRequests, forKey: "averageNumberOfRequests")
                    try container.encodeIfPresent(count, forKey: "count")
                    try container.encodeIfPresent(p50NumberOfRequests, forKey: "p50NumberOfRequests")
                    try container.encodeIfPresent(p95NumberOfRequests, forKey: "p95NumberOfRequests")
                }
            }
        }

        public enum Granularity: String, Sendable, Codable, CaseIterable {
            case P1D
            case PT15M
            case PT1H
        }
    }
}
