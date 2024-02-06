import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingRuleErrorsV1MetricResponse
 The response body for fetching the rule errors.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleerrorsv1metricresponse>
 */
public struct GameCenterMatchmakingRuleErrorsV1MetricResponse: Codable, PagedResponse {
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
     # GameCenterMatchmakingRuleErrorsV1MetricResponse.Data
     The data structure in a response body for the rule errors.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleerrorsv1metricresponse/data>
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
         # GameCenterMatchmakingRuleErrorsV1MetricResponse.Data.DataPoints
         The key properties of the data in the response.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleerrorsv1metricresponse/data/datapoints>
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
             # GameCenterMatchmakingRuleErrorsV1MetricResponse.Data.DataPoints.Values
             The values of the data points.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleerrorsv1metricresponse/data/datapoints/values>
             */
            public struct Values: Codable {
                /// The number of rule errors in the response.
                public var count: Int?

                public init(count: Int? = nil) {
                    self.count = count
                }
            }
        }

        /**
         # GameCenterMatchmakingRuleErrorsV1MetricResponse.Data.Dimensions
         The details of the data in the response.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleerrorsv1metricresponse/data/dimensions>
         */
        public struct Dimensions: Codable {
            public var gameCenterMatchmakingQueue: GameCenterMatchmakingQueue?

            public init(gameCenterMatchmakingQueue: GameCenterMatchmakingQueue? = nil) {
                self.gameCenterMatchmakingQueue = gameCenterMatchmakingQueue
            }

            /**
             # GameCenterMatchmakingRuleErrorsV1MetricResponse.Data.Dimensions.GameCenterMatchmakingQueue
             The links to the details of the rule errors.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleerrorsv1metricresponse/data/dimensions/gamecentermatchmakingqueue>
             */
            public struct GameCenterMatchmakingQueue: Codable {
                public var links: Links?

                public init(links: Links? = nil) {
                    self.links = links
                }

                /**
                 # GameCenterMatchmakingRuleErrorsV1MetricResponse.Data.Dimensions.GameCenterMatchmakingQueue.Links
                 The link representation of the results.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleerrorsv1metricresponse/data/dimensions/gamecentermatchmakingqueue/links>
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
            case PT15M
            case PT1H
        }
    }
}
