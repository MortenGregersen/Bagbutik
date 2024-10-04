import Bagbutik_Core
import Foundation

/**
 # BetaBuildUsagesV1MetricResponse
 A response that contains one or more beta build metric resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betabuildusagesv1metricresponse>
 */
public struct BetaBuildUsagesV1MetricResponse: Codable, Sendable, PagedResponse {
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
                public var crashCount: Int?
                public var feedbackCount: Int?
                public var installCount: Int?
                public var inviteCount: Int?
                public var sessionCount: Int?

                public init(crashCount: Int? = nil,
                            feedbackCount: Int? = nil,
                            installCount: Int? = nil,
                            inviteCount: Int? = nil,
                            sessionCount: Int? = nil)
                {
                    self.crashCount = crashCount
                    self.feedbackCount = feedbackCount
                    self.installCount = installCount
                    self.inviteCount = inviteCount
                    self.sessionCount = sessionCount
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    crashCount = try container.decodeIfPresent(Int.self, forKey: "crashCount")
                    feedbackCount = try container.decodeIfPresent(Int.self, forKey: "feedbackCount")
                    installCount = try container.decodeIfPresent(Int.self, forKey: "installCount")
                    inviteCount = try container.decodeIfPresent(Int.self, forKey: "inviteCount")
                    sessionCount = try container.decodeIfPresent(Int.self, forKey: "sessionCount")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(crashCount, forKey: "crashCount")
                    try container.encodeIfPresent(feedbackCount, forKey: "feedbackCount")
                    try container.encodeIfPresent(installCount, forKey: "installCount")
                    try container.encodeIfPresent(inviteCount, forKey: "inviteCount")
                    try container.encodeIfPresent(sessionCount, forKey: "sessionCount")
                }
            }
        }
    }
}
