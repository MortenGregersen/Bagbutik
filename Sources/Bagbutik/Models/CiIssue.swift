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

    /**
     The attributes that describe an Issues resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/ciissue/attributes>
     */
    public struct Attributes: Codable {
        /// A string representing the issue’s category; for example, the name of the build phase where the issue occurred.
        public let category: String?
        /// The file and line number where Xcode Cloud encountered an issue.
        public let fileSource: FileLocation?
        /// A string that indicates what kind of issue Xcode Cloud encountered.
        public let issueType: IssueType?
        /// Information about the issue that occurred.
        public let message: String?

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
