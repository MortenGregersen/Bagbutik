import Foundation

/**
 A response that contains a single Beta App Clip Invocations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationresponse>
 */
public struct BetaAppClipInvocationResponse: Codable {
    /// The resource data.
    public let data: BetaAppClipInvocation
    /// The included related resources.
    @NullCodable public var included: [BetaAppClipInvocationLocalization]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: BetaAppClipInvocation, included: [BetaAppClipInvocationLocalization]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
