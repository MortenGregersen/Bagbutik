import Foundation

/**
 A response that contains a single App Previews resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewresponse>
 */
public struct AppPreviewResponse: Codable {
    /// The resource data.
    public let data: AppPreview
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppPreview, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
