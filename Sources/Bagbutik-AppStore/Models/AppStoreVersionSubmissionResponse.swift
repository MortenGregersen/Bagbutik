import Foundation
import Bagbutik_Core

/**
 # AppStoreVersionSubmissionResponse
 A response that contains a single App Store Version Submissions resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionsubmissionresponse>
 */
public struct AppStoreVersionSubmissionResponse: Codable {
    public let data: AppStoreVersionSubmission
    public var included: [AppStoreVersion]?
    public let links: DocumentLinks

    public init(data: AppStoreVersionSubmission,
                included: [AppStoreVersion]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
