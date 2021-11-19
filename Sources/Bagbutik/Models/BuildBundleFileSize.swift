import Foundation

/**
 The data structure that represents a Build Bundle File Sizes resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildbundlefilesize>
 */
public struct BuildBundleFileSize: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "buildBundleFileSizes" }
    /// The resource's attributes.
    public let attributes: Attributes?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decode(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case links
        case type
        case attributes
    }

    /**
     The attributes that describe a Build Bundle File Sizes resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/buildbundlefilesize/attributes>
     */
    public struct Attributes: Codable {
        /// A string that identifies the Apple device model.
        public let deviceModel: String?
        /// An integer value that represents the download size of the build bundle in bytes.
        public let downloadBytes: Int?
        /// An integer value that represents the installation size of the build bundle in bytes.
        public let installBytes: Int?
        /// A string that identifies the OS version supported by the app or App Clip.
        public let osVersion: String?

        public init(deviceModel: String? = nil, downloadBytes: Int? = nil, installBytes: Int? = nil, osVersion: String? = nil) {
            self.deviceModel = deviceModel
            self.downloadBytes = downloadBytes
            self.installBytes = installBytes
            self.osVersion = osVersion
        }
    }
}
