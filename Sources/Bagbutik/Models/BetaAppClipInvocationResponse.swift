import Foundation

public struct BetaAppClipInvocationResponse: Codable {
    public let data: BetaAppClipInvocation
    public let included: [BetaAppClipInvocationLocalization]?
    public let links: DocumentLinks

    public init(data: BetaAppClipInvocation, included: [BetaAppClipInvocationLocalization]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
