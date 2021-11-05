import Foundation

/**
 The data structure that represents a Providers resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmprovider>
 */
public struct ScmProvider: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "scmProviders" }
    /// The resource's attributes.
    public let attributes: Attributes?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    /**
     The attributes that describe a Providers resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/scmprovider/attributes>
     */
    public struct Attributes: Codable {
        /// The source code management provider’s type.
        public let scmProviderType: ScmProviderType?
        /// The URL of the source code management provider.
        public let url: String?

        public init(scmProviderType: ScmProviderType? = nil, url: String? = nil) {
            self.scmProviderType = scmProviderType
            self.url = url
        }
    }
}
