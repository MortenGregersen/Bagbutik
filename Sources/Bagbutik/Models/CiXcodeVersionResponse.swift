import Foundation

/**
 A response that contains a single Xcode Versions resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cixcodeversionresponse>
 */
public struct CiXcodeVersionResponse: Codable {
    /// The resource data.
    public let data: CiXcodeVersion
    /// The included related resources.
    public var included: [CiMacOsVersion]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: CiXcodeVersion, included: [CiMacOsVersion]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
