import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingNumberRuleResultsV1MetricResponse
 The response body for fetching the results of applying numeric rules.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingnumberruleresultsv1metricresponse>
 */
public struct GameCenterMatchmakingNumberRuleResultsV1MetricResponse: Codable, PagedResponse {
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode([Data].self, forKey: .data)
        links = try container.decode(PagedDocumentLinks.self, forKey: .links)
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encode(links, forKey: .links)
        try container.encodeIfPresent(meta, forKey: .meta)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case links
        case meta
    }

    /**
     # GameCenterMatchmakingNumberRuleResultsV1MetricResponse.Data
     The data structure in a response body for numeric rule results.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingnumberruleresultsv1metricresponse/data>
     */
    public struct Data: Codable {
        public var dataPoints: DataPoints?
        public var dimensions: Dimensions?
        /// The granularity of the data using the ISO 8601 format for durations.
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
            let container = try decoder.container(keyedBy: CodingKeys.self)
            dataPoints = try container.decodeIfPresent(DataPoints.self, forKey: .dataPoints)
            dimensions = try container.decodeIfPresent(Dimensions.self, forKey: .dimensions)
            granularity = try container.decodeIfPresent(Granularity.self, forKey: .granularity)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(dataPoints, forKey: .dataPoints)
            try container.encodeIfPresent(dimensions, forKey: .dimensions)
            try container.encodeIfPresent(granularity, forKey: .granularity)
        }

        private enum CodingKeys: String, CodingKey {
            case dataPoints
            case dimensions
            case granularity
        }

        /**
         # GameCenterMatchmakingNumberRuleResultsV1MetricResponse.Data.DataPoints
         The key properties of the data in the response.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingnumberruleresultsv1metricresponse/data/datapoints>
         */
        public struct DataPoints: Codable {
            /// The time Game Center ends the data collection.
            public var end: Date?
            /// The time Game Center starts the data collection.
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

            /**
             # GameCenterMatchmakingNumberRuleResultsV1MetricResponse.Data.DataPoints.Values
             The values of the data points.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingnumberruleresultsv1metricresponse/data/datapoints/values>
             */
            public struct Values: Codable {
                /// The average result of numeric rules.
                public var averageResult: Double?
                /// The number of rule results in the response.
                public var count: Int?
                /// The number of results in the 50th percentile.
                public var p50Result: Double?
                /// The number of results in the 95th percentile.
                public var p95Result: Double?

                public init(averageResult: Double? = nil,
                            count: Int? = nil,
                            p50Result: Double? = nil,
                            p95Result: Double? = nil)
                {
                    self.averageResult = averageResult
                    self.count = count
                    self.p50Result = p50Result
                    self.p95Result = p95Result
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    averageResult = try container.decodeIfPresent(Double.self, forKey: .averageResult)
                    count = try container.decodeIfPresent(Int.self, forKey: .count)
                    p50Result = try container.decodeIfPresent(Double.self, forKey: .p50Result)
                    p95Result = try container.decodeIfPresent(Double.self, forKey: .p95Result)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(averageResult, forKey: .averageResult)
                    try container.encodeIfPresent(count, forKey: .count)
                    try container.encodeIfPresent(p50Result, forKey: .p50Result)
                    try container.encodeIfPresent(p95Result, forKey: .p95Result)
                }

                private enum CodingKeys: String, CodingKey {
                    case averageResult
                    case count
                    case p50Result
                    case p95Result
                }
            }
        }

        /**
         # GameCenterMatchmakingNumberRuleResultsV1MetricResponse.Data.Dimensions
         The details of the data in the response.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingnumberruleresultsv1metricresponse/data/dimensions>
         */
        public struct Dimensions: Codable {
            public var gameCenterMatchmakingQueue: GameCenterMatchmakingQueue?

            public init(gameCenterMatchmakingQueue: GameCenterMatchmakingQueue? = nil) {
                self.gameCenterMatchmakingQueue = gameCenterMatchmakingQueue
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                gameCenterMatchmakingQueue = try container.decodeIfPresent(GameCenterMatchmakingQueue.self, forKey: .gameCenterMatchmakingQueue)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encodeIfPresent(gameCenterMatchmakingQueue, forKey: .gameCenterMatchmakingQueue)
            }

            private enum CodingKeys: String, CodingKey {
                case gameCenterMatchmakingQueue
            }

            /**
             # GameCenterMatchmakingNumberRuleResultsV1MetricResponse.Data.Dimensions.GameCenterMatchmakingQueue
             The details of the data about the queue.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingnumberruleresultsv1metricresponse/data/dimensions/gamecentermatchmakingqueue>
             */
            public struct GameCenterMatchmakingQueue: Codable {
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

                /**
                 # GameCenterMatchmakingNumberRuleResultsV1MetricResponse.Data.Dimensions.GameCenterMatchmakingQueue.Links
                 The link representations of the queue results.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingnumberruleresultsv1metricresponse/data/dimensions/gamecentermatchmakingqueue/links>
                 */
                public struct Links: Codable {
                    /// A string URI representation of the data that Game Center organizes by group.
                    public var groupBy: String?
                    /// A string URI representation of the related data.
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

        public enum Granularity: String, Codable, CaseIterable {
            case P1D
            case PT15M
            case PT1H
        }
    }
}
