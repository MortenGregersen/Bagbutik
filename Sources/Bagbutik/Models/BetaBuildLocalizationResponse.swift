import Foundation

public struct BetaBuildLocalizationResponse: Codable {
    public let data: BetaBuildLocalization
    public let included: [Build]?
    public let links: DocumentLinks

    public init(data: BetaBuildLocalization, included: [Build]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
