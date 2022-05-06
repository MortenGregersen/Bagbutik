import Foundation

/**
 A response that contains a list of Bundle ID Capability resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcapabilitiesresponse>
 */
public struct BundleIdCapabilitiesResponse: Codable, PagedResponse {
    public typealias Data = BundleIdCapability
    /// The resource data.
    public let data: [BundleIdCapability]
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public var meta: PagingInformation?

    public init(data: [BundleIdCapability], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
