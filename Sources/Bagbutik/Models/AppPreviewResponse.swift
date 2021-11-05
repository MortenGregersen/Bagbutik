import Foundation

/**
 A response that contains a single App Previews resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewresponse>
 */
public struct AppPreviewResponse: Codable {
    /// The resource data.
    public let data: AppPreview
    /// The included related resources.
    public let included: [AppPreviewSet]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppPreview, included: [AppPreviewSet]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
