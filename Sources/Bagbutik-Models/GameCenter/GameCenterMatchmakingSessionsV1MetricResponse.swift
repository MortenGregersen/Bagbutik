import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingSessionsV1MetricResponse
 The response body for information about a successful matchmaking session.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingsessionsv1metricresponse>
 */
public struct GameCenterMatchmakingSessionsV1MetricResponse: Codable, PagedResponse {
    /// The data structure for the results of a successful matchmaking session.
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
     # GameCenterMatchmakingSessionsV1MetricResponse.Data
     The data structure for the results of a successful matchmaking session.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingsessionsv1metricresponse/data>
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

            /**
             # GameCenterMatchmakingSessionsV1MetricResponse.Data.DataPoints.Values
             The data values in the response per session.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingsessionsv1metricresponse/data/datapoints/values>
             */
            public struct Values: Codable {
                /// The average number of players Game Center finds for the match.
                public var averagePlayerCount: Double?
                /// The number of players Game Center finds for the match.
                public var count: Int?
                /// The 50th percentile number of players Game Center finds for the match.
                public var p50PlayerCount: Double?
                /// The 95th percentile number of players Game Center finds for the match.
                public var p95PlayerCount: Double?

                public init(averagePlayerCount: Double? = nil,
                            count: Int? = nil,
                            p50PlayerCount: Double? = nil,
                            p95PlayerCount: Double? = nil)
                {
                    self.averagePlayerCount = averagePlayerCount
                    self.count = count
                    self.p50PlayerCount = p50PlayerCount
                    self.p95PlayerCount = p95PlayerCount
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
