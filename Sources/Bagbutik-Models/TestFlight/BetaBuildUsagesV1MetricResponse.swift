import Bagbutik_Core
import Foundation

/**
 # BetaBuildUsagesV1MetricResponse
 A response that contains one or more beta build metric resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betabuildusagesv1metricresponse>
 */
public struct BetaBuildUsagesV1MetricResponse: Codable, PagedResponse {
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

    public struct Data: Codable {
        public var dataPoints: DataPoints?
        public var dimensions: Dimensions?

        public init(dataPoints: DataPoints? = nil,
                    dimensions: Dimensions? = nil)
        {
            self.dataPoints = dataPoints
            self.dimensions = dimensions
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

            public struct Values: Codable {
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
            }
        }

        public struct Dimensions: Codable {
            public var bundleIds: BundleIds?

            public init(bundleIds: BundleIds? = nil) {
                self.bundleIds = bundleIds
            }

            public struct BundleIds: Codable {
                public var links: Links?

                public init(links: Links? = nil) {
                    self.links = links
                }

                public struct Links: Codable {
                    public var groupBy: String?

                    public init(groupBy: String? = nil) {
                        self.groupBy = groupBy
                    }
                }
            }
        }
    }
}
