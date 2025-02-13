import Bagbutik_Core
import Bagbutik_Models
import Foundation

public struct BetaPublicLinkUsagesV1MetricResponse: Codable, Sendable, PagedResponse {
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

        public init(dataPoints: DataPoints? = nil) {
            self.dataPoints = dataPoints
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            dataPoints = try container.decodeIfPresent(DataPoints.self, forKey: "dataPoints")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(dataPoints, forKey: "dataPoints")
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
                public var acceptedCount: Int?
                public var didNotAcceptCount: Int?
                public var didNotMeetCriteriaCount: Int?
                public var notClearRatio: Double?
                public var notInterestingRatio: Double?
                public var notRelevantRatio: Double?
                public var viewCount: Int?

                public init(acceptedCount: Int? = nil,
                            didNotAcceptCount: Int? = nil,
                            didNotMeetCriteriaCount: Int? = nil,
                            notClearRatio: Double? = nil,
                            notInterestingRatio: Double? = nil,
                            notRelevantRatio: Double? = nil,
                            viewCount: Int? = nil)
                {
                    self.acceptedCount = acceptedCount
                    self.didNotAcceptCount = didNotAcceptCount
                    self.didNotMeetCriteriaCount = didNotMeetCriteriaCount
                    self.notClearRatio = notClearRatio
                    self.notInterestingRatio = notInterestingRatio
                    self.notRelevantRatio = notRelevantRatio
                    self.viewCount = viewCount
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    acceptedCount = try container.decodeIfPresent(Int.self, forKey: "acceptedCount")
                    didNotAcceptCount = try container.decodeIfPresent(Int.self, forKey: "didNotAcceptCount")
                    didNotMeetCriteriaCount = try container.decodeIfPresent(Int.self, forKey: "didNotMeetCriteriaCount")
                    notClearRatio = try container.decodeIfPresent(Double.self, forKey: "notClearRatio")
                    notInterestingRatio = try container.decodeIfPresent(Double.self, forKey: "notInterestingRatio")
                    notRelevantRatio = try container.decodeIfPresent(Double.self, forKey: "notRelevantRatio")
                    viewCount = try container.decodeIfPresent(Int.self, forKey: "viewCount")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(acceptedCount, forKey: "acceptedCount")
                    try container.encodeIfPresent(didNotAcceptCount, forKey: "didNotAcceptCount")
                    try container.encodeIfPresent(didNotMeetCriteriaCount, forKey: "didNotMeetCriteriaCount")
                    try container.encodeIfPresent(notClearRatio, forKey: "notClearRatio")
                    try container.encodeIfPresent(notInterestingRatio, forKey: "notInterestingRatio")
                    try container.encodeIfPresent(notRelevantRatio, forKey: "notRelevantRatio")
                    try container.encodeIfPresent(viewCount, forKey: "viewCount")
                }
            }
        }
    }
}
