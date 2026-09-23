import BagbutikCore
import Foundation

/**
 # ReviewSubmissionItemsLinkagesResponse

 A response containing the resource identifiers of items included in a review submission.

 ```
 object ReviewSubmissionItemsLinkagesResponse
 ```

 ## Topics

 ### Dictionaries

 [`object ReviewSubmissionItemsLinkagesResponse.Data`](https://developer.apple.com/documentation/AppStoreConnectAPI/ReviewSubmissionItemsLinkagesResponse/Data-data.dictionary)

 The data element of the response body.

 ## See Also

 [`object ReviewSubmission`](https://developer.apple.com/documentation/AppStoreConnectAPI/ReviewSubmission)

 A formal submission to App Store review grouping one or more items — app versions, In-App Purchases, or events — for simultaneous review.

 [`object ReviewSubmissionItem`](https://developer.apple.com/documentation/AppStoreConnectAPI/ReviewSubmissionItem)

 An individual reviewable item — such as an app version, In-App Purchase, or App Clip — included in a review submission.

 [`object ReviewSubmissionUpdateRequest`](https://developer.apple.com/documentation/AppStoreConnectAPI/ReviewSubmissionUpdateRequest)

 The request body you use to update a review submission update request.

 [`object ReviewSubmissionCreateRequest`](https://developer.apple.com/documentation/AppStoreConnectAPI/ReviewSubmissionCreateRequest)

 The request body for creating a review submission for an App Store version or associated items.

 [`object ReviewSubmissionResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/ReviewSubmissionResponse)

 The response body for endpoints that create, read, or modify a single review submission.

 [`object ReviewSubmissionsResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/ReviewSubmissionsResponse)

 The response body for endpoints that list review submissions for an app.

 [`object AppReviewSubmissionsLinkagesResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppReviewSubmissionsLinkagesResponse)

 A response containing the resource identifiers of review submissions associated with an app.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/reviewsubmissionitemslinkagesresponse>
 */
public struct ReviewSubmissionItemsLinkagesResponse: Codable, Sendable, PagedResponse {
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
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([Data].self, forKey: "data")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }

    public struct Data: Codable, Sendable, Identifiable {
        public let id: String
        public var type: String { "reviewSubmissionItems" }

        public init(id: String) {
            self.id = id
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            id = try container.decode(String.self, forKey: "id")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(id, forKey: "id")
            try container.encode(type, forKey: "type")
        }
    }
}
