import Foundation
import Bagbutik_Core

/**
 # AppStoreVersionReleaseRequestResponse
 A response that contains a single App Store Version Release Request resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionreleaserequestresponse>
 */
public struct AppStoreVersionReleaseRequestResponse: Codable {
    /// The resource data.
    public let data: AppStoreVersionReleaseRequest
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppStoreVersionReleaseRequest,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
