import Foundation

/**
 # AppClipHeaderImageResponse
 A response that contains a single App Clip Header Images resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimageresponse>
 */
public struct AppClipHeaderImageResponse: Codable {
    /// The resource data.
    public let data: AppClipHeaderImage
    /// The requested relationship data.
    public var included: [AppClipDefaultExperienceLocalization]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppClipHeaderImage,
                included: [AppClipDefaultExperienceLocalization]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
