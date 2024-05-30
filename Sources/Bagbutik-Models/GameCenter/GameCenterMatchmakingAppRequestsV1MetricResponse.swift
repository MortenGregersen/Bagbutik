import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingAppRequestsV1MetricResponse
 The response body for fetching a match request.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingapprequestsv1metricresponse>
 */
public struct GameCenterMatchmakingAppRequestsV1MetricResponse: Codable, PagedResponse {
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
     # GameCenterMatchmakingAppRequestsV1MetricResponse.Data
     The data structure in a response body for a match request.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingapprequestsv1metricresponse/data>
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
         # GameCenterMatchmakingAppRequestsV1MetricResponse.Data.DataPoints
         The data properties in the response.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingapprequestsv1metricresponse/data/datapoints>
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
             # GameCenterMatchmakingAppRequestsV1MetricResponse.Data.DataPoints.Values
             The values of the data points.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingapprequestsv1metricresponse/data/datapoints/values>
             */
            public struct Values: Codable {
                /// The average seconds that match requests are in the queue.
                public var averageSecondsInQueue: Double?
                /// The number of match requests in the response.
                public var count: Int?
                /// The number of seconds the 50th percentile of the match requests are in the queue.
                public var p50SecondsInQueue: Double?
                /// The number of seconds that the 95th percentile of the match requests are in the queue.
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
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    averageSecondsInQueue = try container.decodeIfPresent(Double.self, forKey: .averageSecondsInQueue)
                    count = try container.decodeIfPresent(Int.self, forKey: .count)
                    p50SecondsInQueue = try container.decodeIfPresent(Double.self, forKey: .p50SecondsInQueue)
                    p95SecondsInQueue = try container.decodeIfPresent(Double.self, forKey: .p95SecondsInQueue)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(averageSecondsInQueue, forKey: .averageSecondsInQueue)
                    try container.encodeIfPresent(count, forKey: .count)
                    try container.encodeIfPresent(p50SecondsInQueue, forKey: .p50SecondsInQueue)
                    try container.encodeIfPresent(p95SecondsInQueue, forKey: .p95SecondsInQueue)
                }

                private enum CodingKeys: String, CodingKey {
                    case averageSecondsInQueue
                    case count
                    case p50SecondsInQueue
                    case p95SecondsInQueue
                }
            }
        }

        /**
         # GameCenterMatchmakingAppRequestsV1MetricResponse.Data.Dimensions
         The details of the data in the response.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingapprequestsv1metricresponse/data/dimensions>
         */
        public struct Dimensions: Codable {
            public var result: Result?

            public init(result: Result? = nil) {
                self.result = result
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                result = try container.decodeIfPresent(Result.self, forKey: .result)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encodeIfPresent(result, forKey: .result)
            }

            private enum CodingKeys: String, CodingKey {
                case result
            }

            /**
             # GameCenterMatchmakingAppRequestsV1MetricResponse.Data.Dimensions.Result
             The links to the details of the data.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingapprequestsv1metricresponse/data/dimensions/result>
             */
            public struct Result: Codable {
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
                 # GameCenterMatchmakingAppRequestsV1MetricResponse.Data.Dimensions.Result.Links
                 The link representation of the results.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingapprequestsv1metricresponse/data/dimensions/result/links>
                 */
                public struct Links: Codable {
                    /// A string URI representation of the data that Game Center organizes by group.
                    public var groupBy: String?

                    public init(groupBy: String? = nil) {
                        self.groupBy = groupBy
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: CodingKeys.self)
                        groupBy = try container.decodeIfPresent(String.self, forKey: .groupBy)
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: CodingKeys.self)
                        try container.encodeIfPresent(groupBy, forKey: .groupBy)
                    }

                    private enum CodingKeys: String, CodingKey {
                        case groupBy
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
