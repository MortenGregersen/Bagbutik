import Foundation

public struct AppPreviewSetResponse: Codable {
    public let data: AppPreviewSet
    public let included: [AppPreview]?
    public let links: DocumentLinks

    public init(data: AppPreviewSet, included: [AppPreview]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
