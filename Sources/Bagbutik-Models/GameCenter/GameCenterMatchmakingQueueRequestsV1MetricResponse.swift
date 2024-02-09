import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingQueueRequestsV1MetricResponse
 The response body for match requests in a queue.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueuerequestsv1metricresponse>
 */
public struct GameCenterMatchmakingQueueRequestsV1MetricResponse: Codable, PagedResponse {
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
     # GameCenterMatchmakingQueueRequestsV1MetricResponse.Data
     The data structure in a response body for the match requests in a queue.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueuerequestsv1metricresponse/data>
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
         # GameCenterMatchmakingQueueRequestsV1MetricResponse.Data.DataPoints
         The key properties of the data in the response.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueuerequestsv1metricresponse/data/datapoints>
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
             # GameCenterMatchmakingQueueRequestsV1MetricResponse.Data.DataPoints.Values
             The values of the data points.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueuerequestsv1metricresponse/data/datapoints/values>
             */
            public struct Values: Codable {
                /// The average seconds that match requests are in the queue.
                public var averageSecondsInQueue: Double?
                /// The number of match requests in the queue.
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
            }
        }

        /**
         # GameCenterMatchmakingQueueRequestsV1MetricResponse.Data.Dimensions
         The details of the data in the response.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueuerequestsv1metricresponse/data/dimensions>
         */
        public struct Dimensions: Codable {
            public var gameCenterDetail: GameCenterDetail?
            public var result: Result?

            public init(gameCenterDetail: GameCenterDetail? = nil,
                        result: Result? = nil)
            {
                self.gameCenterDetail = gameCenterDetail
                self.result = result
            }

            /**
             # GameCenterMatchmakingQueueRequestsV1MetricResponse.Data.Dimensions.GameCenterDetail
             The links to the details of the Game Center data.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueuerequestsv1metricresponse/data/dimensions/gamecenterdetail>
             */
            public struct GameCenterDetail: Codable {
                public var links: Links?

                public init(links: Links? = nil) {
                    self.links = links
                }

                /**
                 # GameCenterMatchmakingQueueRequestsV1MetricResponse.Data.Dimensions.GameCenterDetail.Links
                 The link representation of the results.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueuerequestsv1metricresponse/data/dimensions/gamecenterdetail/links>
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

            /**
             # GameCenterMatchmakingQueueRequestsV1MetricResponse.Data.Dimensions.Result
             The links to the details of the data.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueuerequestsv1metricresponse/data/dimensions/result>
             */
            public struct Result: Codable {
                public var links: Links?

                public init(links: Links? = nil) {
                    self.links = links
                }

                /**
                 # GameCenterMatchmakingQueueRequestsV1MetricResponse.Data.Dimensions.Result.Links
                 The link representation of the results.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueuerequestsv1metricresponse/data/dimensions/result/links>
                 */
                public struct Links: Codable {
                    /// A string URI representation of the data that Game Center organizes by group.
                    public var groupBy: String?

                    public init(groupBy: String? = nil) {
                        self.groupBy = groupBy
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
