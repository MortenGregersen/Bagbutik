import Foundation

public struct BetaAppLocalizationResponse: Codable {
    public let data: BetaAppLocalization
    public let included: [App]?
    public let links: DocumentLinks

    public init(data: BetaAppLocalization, included: [App]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
