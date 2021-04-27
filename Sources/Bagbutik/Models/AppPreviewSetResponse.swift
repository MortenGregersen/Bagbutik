import Foundation

/**
 A response that contains a single App Preview Sets resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewsetresponse>
 */
public struct AppPreviewSetResponse: Codable {
    /// The resource data.
    public let data: AppPreviewSet
    /// The included related resources.
    public let included: [AppPreview]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppPreviewSet, included: [AppPreview]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
