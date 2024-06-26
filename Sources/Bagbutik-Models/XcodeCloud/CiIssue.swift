import Bagbutik_Core
import Foundation

/**
 # CiIssue
 The data structure that represents an Issues resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciissue>
 */
public struct CiIssue: Codable, Identifiable {
    /// The opaque resource ID that uniquely identifies an Issues resource.
    public let id: String
    /// The navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "ciIssues" }
    /// The attributes that describe the Issues resource.
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
     # CiIssue.Attributes
     The attributes that describe an Issues resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/ciissue/attributes>
     */
    public struct Attributes: Codable {
        /// ​A string representing the issue’s category; for example, the name of the build phase where the issue occurred.
        public var category: String?
        /// The file and line number where Xcode Cloud encountered an issue.
        public var fileSource: FileLocation?
        /// A string that indicates what kind of issue Xcode Cloud encountered.
        public var issueType: IssueType?
        /// Information about the issue that occurred.
        public var message: String?

        public init(category: String? = nil,
                    fileSource: FileLocation? = nil,
                    issueType: IssueType? = nil,
                    message: String? = nil)
        {
            self.category = category
            self.fileSource = fileSource
            self.issueType = issueType
            self.message = message
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            category = try container.decodeIfPresent(String.self, forKey: "category")
            fileSource = try container.decodeIfPresent(FileLocation.self, forKey: "fileSource")
            issueType = try container.decodeIfPresent(IssueType.self, forKey: "issueType")
            message = try container.decodeIfPresent(String.self, forKey: "message")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(category, forKey: "category")
            try container.encodeIfPresent(fileSource, forKey: "fileSource")
            try container.encodeIfPresent(issueType, forKey: "issueType")
            try container.encodeIfPresent(message, forKey: "message")
        }

        public enum IssueType: String, Codable, CaseIterable {
            case analyzerWarning = "ANALYZER_WARNING"
            case error = "ERROR"
            case testFailure = "TEST_FAILURE"
            case warning = "WARNING"
        }
    }
}
