import Foundation

/**
 The data structure that represents the Diagnostic Logs resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/diagnosticlog>
 */
public struct DiagnosticLog: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "diagnosticLogs" }

    public init(id: String, links: ResourceLinks) {
        self.id = id
        self.links = links
    }
}
