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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case links
        case type
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

        public enum IssueType: String, Codable, CaseIterable {
            case analyzerWarning = "ANALYZER_WARNING"
            case error = "ERROR"
            case testFailure = "TEST_FAILURE"
            case warning = "WARNING"
        }
    }
}
