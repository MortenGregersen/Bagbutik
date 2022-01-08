import Foundation

/**
 The data structure that represents an Artifacts resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciartifact>
 */
public struct CiArtifact: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "ciArtifacts" }
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
     The attributes that describe an Artifacts resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/ciartifact/attributes>
     */
    public struct Attributes: Codable {
        /// The URL you use to download the Xcode Cloud build artifact.
        public var downloadUrl: String?
        /// The artifact’s filename as a string.
        public var fileName: String?
        /// An integer value that represents the artifact’s file size.
        public var fileSize: Int?
        /// A string that describes the type of the artifact.
        @NullCodable public var fileType: FileType?

        public init(downloadUrl: String? = nil, fileName: String? = nil, fileSize: Int? = nil, fileType: FileType? = nil) {
            self.downloadUrl = downloadUrl
            self.fileName = fileName
            self.fileSize = fileSize
            self.fileType = fileType
        }

        public enum FileType: String, Codable, CaseIterable {
            case archive = "ARCHIVE"
            case archiveExport = "ARCHIVE_EXPORT"
            case logBundle = "LOG_BUNDLE"
            case resultBundle = "RESULT_BUNDLE"
            case testProducts = "TEST_PRODUCTS"
            case xcodebuildProducts = "XCODEBUILD_PRODUCTS"
        }
    }
}
