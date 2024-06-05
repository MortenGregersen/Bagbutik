import Bagbutik_Core
import Foundation

/**
 # CiArtifact
 The data structure that represents the output of an Xcode Cloud build action resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciartifact>
 */
public struct CiArtifact: Codable, Identifiable {
    /// The opaque resource ID that uniquely identifies an Artifacts resource.
    public let id: String
    /// The navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "ciArtifacts" }
    /// The attributes that describe the Artifacts resource.
    public var attributes: Attributes?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
    }

    /**
     # CiArtifact.Attributes
     The attributes that describe the output of an artifact resource.

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
        public var fileType: FileType?

        public init(downloadUrl: String? = nil,
                    fileName: String? = nil,
                    fileSize: Int? = nil,
                    fileType: FileType? = nil)
        {
            self.downloadUrl = downloadUrl
            self.fileName = fileName
            self.fileSize = fileSize
            self.fileType = fileType
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            downloadUrl = try container.decodeIfPresent(String.self, forKey: "downloadUrl")
            fileName = try container.decodeIfPresent(String.self, forKey: "fileName")
            fileSize = try container.decodeIfPresent(Int.self, forKey: "fileSize")
            fileType = try container.decodeIfPresent(FileType.self, forKey: "fileType")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(downloadUrl, forKey: "downloadUrl")
            try container.encodeIfPresent(fileName, forKey: "fileName")
            try container.encodeIfPresent(fileSize, forKey: "fileSize")
            try container.encodeIfPresent(fileType, forKey: "fileType")
        }

        public enum FileType: String, Codable, CaseIterable {
            case archive = "ARCHIVE"
            case archiveExport = "ARCHIVE_EXPORT"
            case logBundle = "LOG_BUNDLE"
            case resultBundle = "RESULT_BUNDLE"
            case stapledNotarizedArchive = "STAPLED_NOTARIZED_ARCHIVE"
            case testProducts = "TEST_PRODUCTS"
            case xcodebuildProducts = "XCODEBUILD_PRODUCTS"
        }
    }
}
