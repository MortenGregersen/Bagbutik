import BagbutikCore
import BagbutikModelsShared
import Foundation

/**
 # BetaAppReviewSubmissionResponse

 The response body for endpoints that submit a build for beta app review.

 ```
 object BetaAppReviewSubmissionResponse
 ```

 ## See Also

 [`Submit an app for beta review`](https://developer.apple.com/documentation/AppStoreConnectAPI/POST-v1-betaAppReviewSubmissions)

 Submit an app for beta app review to allow external testing.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappreviewsubmissionresponse>
 */
public struct BetaAppReviewSubmissionResponse: Codable, Sendable {
    public let data: BetaAppReviewSubmission
    public var included: [Build]?
    public let links: DocumentLinks

    public init(data: BetaAppReviewSubmission,
                included: [Build]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BetaAppReviewSubmission.self, forKey: "data")
        included = try container.decodeIfPresent([Build].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
