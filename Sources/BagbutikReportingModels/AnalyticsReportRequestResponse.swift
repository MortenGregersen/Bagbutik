import BagbutikCore
import Foundation

/**
 # AnalyticsReportRequestResponse

 The response body for endpoints that create or read an analytics report request.

 ```
 object AnalyticsReportRequestResponse
 ```

 ## Discussion

 Use this object with [`Read Report Request Information`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-analyticsReportRequests-_id_).

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportrequestresponse>
 */
public struct AnalyticsReportRequestResponse: Codable, Sendable {
    public let data: AnalyticsReportRequest
    public var included: [AnalyticsReport]?
    public let links: DocumentLinks

    public init(data: AnalyticsReportRequest,
                included: [AnalyticsReport]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AnalyticsReportRequest.self, forKey: "data")
        included = try container.decodeIfPresent([AnalyticsReport].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
