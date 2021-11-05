import Foundation

/**
 A response that contains a single Advanced App Clip Experience Images resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceimageresponse>
 */
public struct AppClipAdvancedExperienceImageResponse: Codable {
    /// The resource data.
    public let data: AppClipAdvancedExperienceImage
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppClipAdvancedExperienceImage, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
