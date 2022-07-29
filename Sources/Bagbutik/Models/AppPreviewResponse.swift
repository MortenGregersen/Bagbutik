import Foundation

/**
 # AppPreviewResponse
 A response that contains a single App Previews resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewresponse>
 */
public struct AppPreviewResponse: Codable {
    public let data: AppPreview
    public var included: [AppPreviewSet]?
    public let links: DocumentLinks

    public init(data: AppPreview,
                included: [AppPreviewSet]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
