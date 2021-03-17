import Foundation

/**
 A response that contains a single Bundle ID Capabilities resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcapabilityresponse>
 */
public struct BundleIdCapabilityResponse: Codable {
    /// The resource data.
    public let data: BundleIdCapability
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: BundleIdCapability, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
