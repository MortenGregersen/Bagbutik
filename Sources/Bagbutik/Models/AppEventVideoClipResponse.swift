import Foundation

public struct AppEventVideoClipResponse: Codable {
    public let data: AppEventVideoClip
    public var included: [AppEventLocalization]?
    public let links: DocumentLinks

    public init(data: AppEventVideoClip,
                included: [AppEventLocalization]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
