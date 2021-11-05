import Foundation

/**
 A response that contains a single Artifacts resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciartifactresponse>
 */
public struct CiArtifactResponse: Codable {
    /// The resource data.
    public let data: CiArtifact
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: CiArtifact, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
