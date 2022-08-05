import Bagbutik_Core
import Foundation

/**
 # AppClipDomainStatusResponse
 A response that contains a single App Clip Domain Statuses resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdomainstatusresponse>
 */
public struct AppClipDomainStatusResponse: Codable {
    /// The resource data.
    public let data: AppClipDomainStatus
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppClipDomainStatus,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
