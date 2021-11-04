import Foundation

/**
 The data structure that represents a Territories resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/territory>
 */
public struct Territory: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "territories" }
    /// The resource's attributes.
    public let attributes: Attributes?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    /**
     Attributes that describe a Territories resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/territory/attributes>
     */
    public struct Attributes: Codable {
        public let currency: String?

        public init(currency: String? = nil) {
            self.currency = currency
        }
    }
}
