import Foundation
import Bagbutik_Core

/**
 # AppStoreVersionPhasedReleaseResponse
 A response that contains a single App Store Version Phased Releases resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionphasedreleaseresponse>
 */
public struct AppStoreVersionPhasedReleaseResponse: Codable {
    public let data: AppStoreVersionPhasedRelease
    public let links: DocumentLinks

    public init(data: AppStoreVersionPhasedRelease,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
