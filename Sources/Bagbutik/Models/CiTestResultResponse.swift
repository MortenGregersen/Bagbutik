import Foundation

/**
 A response that contains a single Test Results resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/citestresultresponse>
 */
public struct CiTestResultResponse: Codable {
    /// The resource data.
    public let data: CiTestResult
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: CiTestResult, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
