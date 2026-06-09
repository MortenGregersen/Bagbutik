import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # CiTestResultResponse
 The response body for endpoints that read a single test result from an Xcode Cloud build action.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/citestresultresponse>
 */
public struct CiTestResultResponse: Codable, Sendable {
    /// The resource data.
    public let data: CiTestResult
    /// The navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: CiTestResult,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(CiTestResult.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
