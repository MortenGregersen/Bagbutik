import Bagbutik_Core
import Foundation

/**
 # AppsBetaTesterUsagesV1MetricResponse
 A response that contains one or more beta app tester metric resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appsbetatesterusagesv1metricresponse>
 */
public struct AppsBetaTesterUsagesV1MetricResponse: Codable, PagedResponse {
    public let data: [Data]
    public var included: [BetaTester]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [Data],
                included: [BetaTester]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode([Data].self, forKey: .data)
        included = try container.decodeIfPresent([BetaTester].self, forKey: .included)
        links = try container.decode(PagedDocumentLinks.self, forKey: .links)
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encodeIfPresent(included, forKey: .included)
        try container.encode(links, forKey: .links)
        try container.encodeIfPresent(meta, forKey: .meta)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case included
        case links
        case meta
    }

    public struct Data: Codable {
        public var dataPoints: DataPoints?
        public var dimensions: Dimensions?

        public init(dataPoints: DataPoints? = nil,
                    dimensions: Dimensions? = nil)
        {
            self.dataPoints = dataPoints
            self.dimensions = dimensions
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            dataPoints = try container.decodeIfPresent(DataPoints.self, forKey: .dataPoints)
            dimensions = try container.decodeIfPresent(Dimensions.self, forKey: .dimensions)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(dataPoints, forKey: .dataPoints)
            try container.encodeIfPresent(dimensions, forKey: .dimensions)
        }

        private enum CodingKeys: String, CodingKey {
            case dataPoints
            case dimensions
        }

        public struct DataPoints: Codable {
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                end = try container.decodeIfPresent(Date.self, forKey: .end)
                start = try container.decodeIfPresent(Date.self, forKey: .start)
                values = try container.decodeIfPresent(Values.self, forKey: .values)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encodeIfPresent(end, forKey: .end)
                try container.encodeIfPresent(start, forKey: .start)
                try container.encodeIfPresent(values, forKey: .values)
            }

            private enum CodingKeys: String, CodingKey {
                case end
                case start
                case values
            }

            public struct Values: Codable {
                public var crashCount: Int?
                public var feedbackCount: Int?
                public var sessionCount: Int?

                public init(crashCount: Int? = nil,
                            feedbackCount: Int? = nil,
                            sessionCount: Int? = nil)
                {
                    self.crashCount = crashCount
                    self.feedbackCount = feedbackCount
                    self.sessionCount = sessionCount
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    crashCount = try container.decodeIfPresent(Int.self, forKey: .crashCount)
                    feedbackCount = try container.decodeIfPresent(Int.self, forKey: .feedbackCount)
                    sessionCount = try container.decodeIfPresent(Int.self, forKey: .sessionCount)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(crashCount, forKey: .crashCount)
                    try container.encodeIfPresent(feedbackCount, forKey: .feedbackCount)
                    try container.encodeIfPresent(sessionCount, forKey: .sessionCount)
                }

                private enum CodingKeys: String, CodingKey {
                    case crashCount
                    case feedbackCount
                    case sessionCount
                }
            }
        }

        public struct Dimensions: Codable {
            public var betaTesters: BetaTesters?

            public init(betaTesters: BetaTesters? = nil) {
                self.betaTesters = betaTesters
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                betaTesters = try container.decodeIfPresent(BetaTesters.self, forKey: .betaTesters)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encodeIfPresent(betaTesters, forKey: .betaTesters)
            }

            private enum CodingKeys: String, CodingKey {
                case betaTesters
            }

            public struct BetaTesters: Codable {
                public var links: Links?

                public init(links: Links? = nil) {
                    self.links = links
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    links = try container.decodeIfPresent(Links.self, forKey: .links)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(links, forKey: .links)
                }

                private enum CodingKeys: String, CodingKey {
                    case links
                }

                public struct Links: Codable {
                    public var groupBy: String?
                    public var related: String?

                    public init(groupBy: String? = nil,
                                related: String? = nil)
                    {
                        self.groupBy = groupBy
                        self.related = related
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: CodingKeys.self)
                        groupBy = try container.decodeIfPresent(String.self, forKey: .groupBy)
                        related = try container.decodeIfPresent(String.self, forKey: .related)
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: CodingKeys.self)
                        try container.encodeIfPresent(groupBy, forKey: .groupBy)
                        try container.encodeIfPresent(related, forKey: .related)
                    }

                    private enum CodingKeys: String, CodingKey {
                        case groupBy
                        case related
                    }
                }
            }
        }
    }
}
