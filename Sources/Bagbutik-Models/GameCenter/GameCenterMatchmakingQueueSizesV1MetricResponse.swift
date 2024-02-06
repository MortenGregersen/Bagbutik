import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingQueueSizesV1MetricResponse
 The response body for fetching the queue sizes.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueuesizesv1metricresponse>
 */
public struct GameCenterMatchmakingQueueSizesV1MetricResponse: Codable, PagedResponse {
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
     # GameCenterMatchmakingQueueSizesV1MetricResponse.Data
     The data structure in a response body for queue sizes.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueuesizesv1metricresponse/data>
     */
    public struct Data: Codable {
        public var dataPoints: DataPoints?
        /// The granularity of the data using the ISO 8601 format for durations.
        public var granularity: Granularity?

        public init(dataPoints: DataPoints? = nil,
                    granularity: Granularity? = nil)
        {
            self.dataPoints = dataPoints
            self.granularity = granularity
        }

        /**
         # GameCenterMatchmakingQueueSizesV1MetricResponse.Data.DataPoints
         The key properties of the data in the response.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueuesizesv1metricresponse/data/datapoints>
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
             # GameCenterMatchmakingQueueSizesV1MetricResponse.Data.DataPoints.Values
             The values of the data points.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueuesizesv1metricresponse/data/datapoints/values>
             */
            public struct Values: Codable {
                /// The average number of match requests in the queue.
                public var averageNumberOfRequests: Double?
                /// The number of match requests in the queue.
                public var count: Int?
                /// The number of requests in the 50th percentile.
                public var p50NumberOfRequests: Double?
                /// The number of requests in the 95th percentile.
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
            }
        }

        public enum Granularity: String, Codable, CaseIterable {
            case P1D
            case PT15M
            case PT1H
        }
    }
}
