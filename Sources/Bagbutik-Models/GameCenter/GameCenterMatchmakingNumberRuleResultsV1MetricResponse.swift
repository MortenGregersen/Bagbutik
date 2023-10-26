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
                }
            }
        }

        public enum Granularity: String, Codable, CaseIterable {
            case P1D
            case PT1H
            case PT15M
        }
    }
}
