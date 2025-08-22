import Bagbutik_Core
import Foundation

/**
 # CiArtifact
 The data structure that represents the output of an Xcode Cloud build action resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciartifact>
 */
public struct CiArtifact: Codable, Sendable, Identifiable {
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

    public struct Attributes: Codable, Sendable {
        public var downloadUrl: String?
        public var fileName: String?
        public var fileSize: Int?
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

        public enum FileType: String, Sendable, Codable, CaseIterable {
            case archive = "ARCHIVE"
            case archiveExport = "ARCHIVE_EXPORT"
            case logBundle = "LOG_BUNDLE"
            case resultBundle = "RESULT_BUNDLE"
            case stapledNotarizedArchive = "STAPLED_NOTARIZED_ARCHIVE"
            case testProducts = "TEST_PRODUCTS"
            case xcodebuildProducts = "XCODEBUILD_PRODUCTS"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = FileType(rawValue: string) {
                    self = value
                } else if let value = FileType(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid FileType value: \(string)"
                    )
                }
            }
        }
    }
}
