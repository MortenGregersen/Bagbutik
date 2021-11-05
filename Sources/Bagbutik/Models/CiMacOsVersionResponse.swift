import Foundation

/**
 A response that contains a single macOS Versions resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cimacosversionresponse>
 */
public struct CiMacOsVersionResponse: Codable {
    /// The resource data.
    public let data: CiMacOsVersion
    /// The included related resources.
    public let included: [CiXcodeVersion]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: CiMacOsVersion, included: [CiXcodeVersion]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
