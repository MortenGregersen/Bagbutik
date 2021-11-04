import Foundation

/**
 The data structure that represents the Build Icons resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildicon>
 */
public struct BuildIcon: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "buildIcons" }
    /// The resource's attributes.
    public let attributes: Attributes?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    /**
     Attributes that describe a Build Icons resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/buildicon/attributes>
     */
    public struct Attributes: Codable {
        public let iconAsset: ImageAsset?
        public let iconType: IconAssetType?

        public init(iconAsset: ImageAsset? = nil, iconType: IconAssetType? = nil) {
            self.iconAsset = iconAsset
            self.iconType = iconType
        }
    }
}
