import Foundation

public struct BetaAppClipInvocationLocalizationResponse: Codable {
    public let data: BetaAppClipInvocationLocalization
    public let links: DocumentLinks

    public init(data: BetaAppClipInvocationLocalization, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
