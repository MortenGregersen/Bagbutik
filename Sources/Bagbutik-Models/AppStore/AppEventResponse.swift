import Bagbutik_Core
import Foundation

public struct AppEventResponse: Codable {
    public let data: AppEvent
    public var included: [AppEventLocalization]?
    public let links: DocumentLinks

    public init(data: AppEvent,
                included: [AppEventLocalization]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
