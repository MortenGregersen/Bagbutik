import Foundation

/**
 The data structure that represents an Issues resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciissue>
 */
public struct CiIssue: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "ciIssues" }
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

    public struct Attributes: Codable {
        public var category: String?
        @NullCodable public var fileSource: FileLocation?
        @NullCodable public var issueType: IssueType?
        public var message: String?

        public init(category: String? = nil, fileSource: FileLocation? = nil, issueType: IssueType? = nil, message: String? = nil) {
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
