import Foundation

/**
 A response that contains a single App Store Version Phased Releases resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionphasedreleaseresponse>
 */
public struct AppStoreVersionPhasedReleaseResponse: Codable {
    /// The resource data.
    public let data: AppStoreVersionPhasedRelease
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppStoreVersionPhasedRelease, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
