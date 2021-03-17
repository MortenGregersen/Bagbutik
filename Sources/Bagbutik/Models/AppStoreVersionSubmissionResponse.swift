import Foundation

/**
 A response that contains a single App Store Version Submissions resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionsubmissionresponse>
 */
public struct AppStoreVersionSubmissionResponse: Codable {
    /// The resource data.
    public let data: AppStoreVersionSubmission
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppStoreVersionSubmission, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
